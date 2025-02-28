import 'package:example2/system/models/pagination_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../gen/product/models/product.dart';

class PaginatedState {
  final List<Product> products;
  final int currentPage;
  final int totalPages;
  final bool isLoading;
  final bool isLoadMoreLoading;

  PaginatedState({
    required this.products,
    required this.currentPage,
    required this.totalPages,
    required this.isLoading,
    required this.isLoadMoreLoading,
  });

  PaginatedState copyWith({
    List<Product>? products,
    int? currentPage,
    int? totalPages,
    bool? isLoading,
    bool? isLoadMoreLoading,
  }) {
    return PaginatedState(
      products: products ?? this.products,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isLoading: isLoading ?? this.isLoading,
      isLoadMoreLoading: isLoadMoreLoading ?? this.isLoadMoreLoading,
    );
  }
}

class PaginatedNotifier extends StateNotifier<PaginatedState> {
  PaginatedNotifier()
      : super(PaginatedState(
          products: [],
          currentPage: 1,
          totalPages: 1,
          isLoading: false,
          isLoadMoreLoading: false,
        ));

  Future<void> loadNextPage() async {
    if (state.isLoadMoreLoading || state.currentPage >= state.totalPages)
      return;

    state = state.copyWith(isLoadMoreLoading: true);
    try {
      var response = await fetchData(state.currentPage + 1);
      state = state.copyWith(
        products: [...state.products, ...response.products],
        currentPage: response.currentPage,
        totalPages: response.totalPages,
        isLoadMoreLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadMoreLoading: false);
    }
  }

  Future<PaginatedModel> fetchData(int page) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final response = await http.get(
      Uri.parse('http://localhost:3000/products?page=$page'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return PaginatedModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}

final paginatedProvider =
    StateNotifierProvider<PaginatedNotifier, PaginatedState>((ref) {
  return PaginatedNotifier();
});

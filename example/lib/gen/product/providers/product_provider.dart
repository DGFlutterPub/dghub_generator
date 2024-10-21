import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';

var productProvider = StateNotifierProvider<
    ProductNotifier,
    AsyncValue<Product>>((ref) => ProductNotifier());

class ProductNotifier extends StateNotifier<AsyncValue<Product>> {
   ProductNotifier() : super(const AsyncLoading());
  
  final _api = ProductApi();

  refresh({required String id}) {
    state = const AsyncLoading();
    _api.product(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
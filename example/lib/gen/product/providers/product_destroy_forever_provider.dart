import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';

var productDestroyForeverProvider = StateNotifierProvider<
    ProductDestroyForeverNotifier,
    AsyncValue<Product>>((ref) => ProductDestroyForeverNotifier());

class ProductDestroyForeverNotifier extends StateNotifier<AsyncValue<Product>> {
   ProductDestroyForeverNotifier() : super(const AsyncLoading());
  
  final _api = ProductApi();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.destroyForever(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
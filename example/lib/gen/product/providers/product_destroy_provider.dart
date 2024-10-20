import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';

var productDestroyProvider =
    StateNotifierProvider<ProductDestroyNotifier, AsyncValue<Product>>(
        (ref) => ProductDestroyNotifier());

class ProductDestroyNotifier extends StateNotifier<AsyncValue<Product>> {
  ProductDestroyNotifier() : super(const AsyncLoading());

  final _api = ProductApi();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.destroy(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}

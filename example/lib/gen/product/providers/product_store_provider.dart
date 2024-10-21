import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';

var productStoreProvider = StateNotifierProvider<
    ProductStoreNotifier,
    AsyncValue<Product>?>((ref) => ProductStoreNotifier());

class ProductStoreNotifier extends StateNotifier<AsyncValue<Product>?> {
   ProductStoreNotifier() : super(null);
  
  final _api = ProductApi();

  productStore({required FormData form}) {
    state = const AsyncLoading();
    _api.productStore(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
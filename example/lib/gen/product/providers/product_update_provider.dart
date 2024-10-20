import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';

var productUpdateProvider = StateNotifierProvider<
    ProductUpdateNotifier,
    AsyncValue<Product>?>((ref) => ProductUpdateNotifier());

class ProductUpdateNotifier extends StateNotifier<AsyncValue<Product>?> {
   ProductUpdateNotifier() : super(null);
  
  final _api = ProductApi();

  update({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.update(form: form,id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
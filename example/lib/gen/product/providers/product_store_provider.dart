import 'package:dghub/gen/product/dababase/product_database.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../apis/product_api.dart';
import '../sockets/product_socket.dart';

var productStoreProvider =
    StateNotifierProvider<ProductStoreNotifier, AsyncValue<Product>?>(
        (ref) => ProductStoreNotifier());

class ProductStoreNotifier extends StateNotifier<AsyncValue<Product>?> {
  ProductStoreNotifier() : super(null);

  final _api = ProductApi();
  final _socket = ProductSocket();

  productStore({required FormData form}) {
    state = const AsyncLoading();
    _api.productStore(form: form).then((response) {
      ProductDatabase.store(response);
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }

  productStoreRealTimeListening() {
    _socket.store(result: (data) {
      ProductDatabase.store(data);
      state = AsyncData(data);
    });
  }
}

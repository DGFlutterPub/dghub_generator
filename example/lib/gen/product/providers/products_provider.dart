import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/products.dart';
import '../models/product_query.dart';
import '../apis/product_api.dart';

var productsProvider = ChangeNotifierProvider<ProductsNotifier>((ref) => ProductsNotifier());

class ProductsNotifier extends ChangeNotifier {
  AsyncValue<Products?> state = const AsyncLoading();
  AsyncValue<bool> loadMoreState = const AsyncData(false);
  final _api = ProductApi();
  ProductQuery query = ProductQuery();
  
  
  refresh() {
    query.page = 1;
    state = const AsyncLoading();
    _api.products(query:query).then((response) {
      state = AsyncData(response);
      notifyListeners();
    }).onError((e, s) {
      state = AsyncError(e!, s);
      notifyListeners();
    });
  }

  loadMore() {
    query.page++;
    loadMoreState = const AsyncLoading();
    _api.products(query:query).then((response) {
      if (response.data.isNotEmpty) {
        state.value?.data = [...state.value?.data ?? [], ...response.data];
        state = AsyncData(state.value);
        loadMoreState = const AsyncData(true);
      } else {
        loadMoreState = const AsyncData(false);
      }
      notifyListeners();
    }).onError((e, s) {
      loadMoreState = AsyncError(e!, s);
      notifyListeners();
    });
  }

  destroy({required String id}) {
    state.value?.data.removeWhere((e) => e.id == id);
    state = AsyncData(state.value);
    notifyListeners();
  }

  store({required Product data}) {
      state.value?.data = [data, ...state.value?.data ?? []];
      state = AsyncData(state.value);
    notifyListeners();
  }

  update({required Product data}) {
    state.value?.data[state.value!.data.indexWhere((e) => e.id == data.id)] = data;
    state = AsyncData(state.value);
    notifyListeners();
  }
}

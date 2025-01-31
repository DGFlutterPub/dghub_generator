import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../models/products.dart';
import '../models/product_query.dart';
import '../apis/product_api.dart';
import '../../../system/states/pagination_state.dart';

var productsProvider = StateNotifierProvider<ProductsNotifier, PaginationState<Products>>(
        (ref) => ProductsNotifier());



class ProductsNotifier extends  StateNotifier<PaginationState<Products>> {
 ProductsNotifier() : super(PaginationLoading());
  
  final _api = ProductApi();
  ProductQuery query = ProductQuery();
  
  
  refresh() {
    query.page = 1;
      state = PaginationLoading();
    _api.products(query:query).then((response) {
     state = PaginationSuccess(response);
    }).onError((e, s) {
     state = PaginationFailed(e.toString());
    });
  }

  loadMore() {
    query.page++;
    state = PaginationLoadMoreLoading();
    _api.products(query:query).then((response) {
   if (response.data.isNotEmpty) {
        state.value?.data = [...state.value?.data ?? [], ...response.data];
        state = PaginationSuccess(state.value);
      }
      state = PaginationLoadMoreSuccess();
     
    }).onError((e, s) {
      state = PaginationLoadMoreFailed(e.toString());
    });
  }

  destroy({required String id}) {
    state.value?.data.removeWhere((e) => e.id == id);
    state = PaginationSuccess(state.value);
    
  }

  store({required Product data}) {
      state.value?.data = [data, ...state.value?.data ?? []];
      state = PaginationSuccess(state.value);

  }

  update({required Product data}) {
    state.value?.data[state.value!.data.indexWhere((e) => e.id == data.id)] = data;
   state = PaginationSuccess(state.value);
  }
}

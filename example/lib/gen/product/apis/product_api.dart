import '../../../system/services/api_services.dart';
import '../models/product.dart';
import 'package:dio/dio.dart';
import '../models/product_query.dart';
import '../models/products.dart';


class ProductApi {
   Future<Product> productStore({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/product_store' ,data: form);
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> product({required String id}) async {
    try {
      var response = await ApiService.request().get('/product/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Products> products({ProductQuery? query}) async {
    try {
      var response = await ApiService.request().get('/products',
      queryParameters: query?.toJson()
      );
      return Products.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> productUpdate({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request().post('/product_update/$id' ,data: form);
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> productDestroy({required String id}) async {
    try {
      var response = await ApiService.request().delete('/product_destroy/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> productsDestroy() async {
    try {
      var response = await ApiService.request().delete('/products_destroy');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> productDestroyForever({required String id}) async {
    try {
      var response = await ApiService.request().delete('/product_destroy_forever/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }


}
import '../../../system/services/api_services.dart';
import '../models/product.dart';
import 'package:dio/dio.dart';
import '../models/product_query.dart';
import '../models/products.dart';


class ProductApi {
   Future<Product> store({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/product' ,data: form);
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> getOne({required String id}) async {
    try {
      var response = await ApiService.request().get('/product/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Products> getAll({ProductQuery? query}) async {
    try {
      var response = await ApiService.request().get(
      '/products',
      queryParameters: query?.toJson()
      );
      return Products.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> update({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request().post('/product/$id' ,data: form);
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> destroy({required String id}) async {
    try {
      var response = await ApiService.request().delete('/product/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> destroyAll() async {
    try {
      var response = await ApiService.request().delete('/product');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Product> destroyForever({required String id}) async {
    try {
      var response = await ApiService.request().delete('/product_forever_destroy/$id');
      return Product.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }


}
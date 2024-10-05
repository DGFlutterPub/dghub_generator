import 'package:example/system/services/api_services.dart';
import 'package:example/system/tools/tools.dart';
import '../../../../gen/product/models/product.dart';
import '../../../../gen/product/models/products.dart';

class ProductApi {
  Future<Products> getAll() async {
    try {
      var response = await ApiService.request().get('/products');
      return Products.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

  Future<Product> getOne() async {
    try {
      var response = await ApiService.request().get('/product');
      return Products.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
}

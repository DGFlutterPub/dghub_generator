import 'package:dio/dio.dart';
/*import*/

class ProductStoreForm{
  ProductStoreForm({
  this.title,

  });

   String? title;


  Future<FormData> toFormData() async => FormData.fromMap({
    "title":  title,

  });
}

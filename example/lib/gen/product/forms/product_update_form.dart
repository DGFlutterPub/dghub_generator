import 'package:dio/dio.dart';
/*import*/

class ProductUpdateForm{
  ProductUpdateForm({
  this.title,

  });

   String? title;


  Future<FormData> toFormData() async => FormData.fromMap({
    "title":  title,

  });
}

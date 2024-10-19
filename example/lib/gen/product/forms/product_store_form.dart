import 'package:dio/dio.dart';
/*import*/

class ProductStoreForm{
  ProductStoreForm({
  this.title,
this.price,
this.enabled,

  });

   String? title;
double? price;
bool? enabled;


  Future<FormData> toFormData() async => FormData.fromMap({
    "title":  title,
"price":  price,
"enabled":  enabled,

  });
}

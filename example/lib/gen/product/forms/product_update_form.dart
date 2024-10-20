import 'package:dio/dio.dart';
import 'dart:io';

class ProductUpdateForm{
  ProductUpdateForm({
  this.title,
this.price,
this.photo,
this.enabled,

  });

   String? title;
double? price;
File? photo;
bool? enabled;


  Future<FormData> toFormData() async => FormData.fromMap({
    "title":  title,
"price":  price,
"photo":  photo == null?null: await MultipartFile.fromFile(photo!.path),
"enabled":  enabled,

  });
}

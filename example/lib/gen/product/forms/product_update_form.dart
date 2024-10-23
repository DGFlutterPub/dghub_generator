import 'package:dio/dio.dart';
import 'dart:io';

class ProductUpdateForm{
  ProductUpdateForm({
  this.title,
this.price,
this.photo,
this.enabled,
this.metaData,

  });

   String? title;
double? price;
File? photo;
bool? enabled;
List<String>? metaData;


  Future<FormData> toFormData() async => FormData.fromMap({
    "title":  title,
"price":  price,
"photo":  photo == null?null: await MultipartFile.fromFile(photo!.path),
"enabled":  enabled,
"metaData":  metaData,

  });
}

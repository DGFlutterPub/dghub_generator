import 'dart:io';

import 'package:dio/dio.dart';

class ProductForm {
  String title;
  File photo;
  ProductForm({required this.title, required this.photo});
  toFormData() async => FormData.fromMap({
        'title': title,
        'photo': await MultipartFile.fromFile(photo.path),
      });
}

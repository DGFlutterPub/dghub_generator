import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Product {
  Product({
  required this.id,
required this.createdAt,
this.updatedAt,
this.deletedAt,
this.title,

  });

   String id;
String createdAt;
String? updatedAt;
String? deletedAt;
String? title;


  factory  Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);  
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ProductModel {
  ProductModel({required this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  String title;

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

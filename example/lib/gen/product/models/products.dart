import 'package:json_annotation/json_annotation.dart';
import './product.dart';

part 'products.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Products {
  Products({
  required this.data,
required this.total,
required this.currentPage,
required this.totalPage
  });

   List<Product> data;
  int total;
  int currentPage;
  int totalPage;

  factory  Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);  
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

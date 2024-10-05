import 'package:json_annotation/json_annotation.dart';
import 'product.dart';
part 'products.g.dart';

@JsonSerializable()
class Products {
  List<Product> data;
  int total;
  int pageCurrent;
  int pageTotal;
  Products(
      {required this.total,
      required this.pageCurrent,
      required this.pageTotal,
      required this.data});
  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}

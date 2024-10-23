import 'package:json_annotation/json_annotation.dart';
part 'product_query.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ProductQuery {
  ProductQuery({
    this.page = 1,
    this.search,
    this.title,
    this.price,
    this.photo,
    this.enabled,
  });

  int page;
  String? search;
  String? title;
  String? price;
  String? photo;
  String? enabled;

  factory ProductQuery.fromJson(Map<String, dynamic> json) =>
      _$ProductQueryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductQueryToJson(this);
}

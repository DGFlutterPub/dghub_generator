import 'package:json_annotation/json_annotation.dart';
part 'product_query.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class ProductQuery {
  ProductQuery({
  this.page = 1,
this.search,
this.title,

  });

   int page;
String? search;
String? title;


  factory  ProductQuery.fromJson(Map<String, dynamic> json) =>
      _$ProductQueryFromJson(json);  
  Map<String, dynamic> toJson() => _$ProductQueryToJson(this);
}

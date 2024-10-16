import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Category {
  Category({
  required this.id,
required this.createdAt,
this.updatedAt,
this.deletedAt,
this.label,

  });

   String id;
String createdAt;
String? updatedAt;
String? deletedAt;
String? label;


  factory  Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);  
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

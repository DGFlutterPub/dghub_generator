import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthModel {
  AuthModel({
    this.email = "example@gmail.com",
    required this.token,
    required this.id,
    required this.createdAt,
    this.deletedAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  String email;

  dynamic token;

  int id;

  String createdAt;

  String? deletedAt;

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

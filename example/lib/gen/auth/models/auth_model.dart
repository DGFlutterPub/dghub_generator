import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthModel {
  AuthModel({
    this.email = "example@gmail.com",
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  String email;

  Null token;

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

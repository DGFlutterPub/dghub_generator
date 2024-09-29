import 'package:json_annotation/json_annotation.dart';
part 'auth_token_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthTokenModel {
  AuthTokenModel({required this.bearer});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  dynamic bearer;

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}

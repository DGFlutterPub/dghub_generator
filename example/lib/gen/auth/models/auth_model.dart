import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthModel {
  String email;
  AuthModel({
    required this.email,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

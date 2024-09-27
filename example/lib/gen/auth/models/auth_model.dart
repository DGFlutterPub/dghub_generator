import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class AuthModel {
  AuthModel({
    this.name = "mg mg",
    this.phone = "0975232323",
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  String name;

  String phone;

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

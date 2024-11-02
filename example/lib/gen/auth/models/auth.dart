import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

part 'auth.g.dart';

@RealmModel()
@JsonSerializable(includeIfNull: true, explicitToJson: true)
class Auth {
  Auth({
  required this.id,
required this.createdAt,
this.updatedAt,
this.deletedAt,
this.email,
this.password,
this.roles,
this.token,

  });

   String id;
String createdAt;
String? updatedAt;
String? deletedAt;
String? email;
String? password;
List<String>? roles;
String? token;


  factory  Auth.fromJson(Map<String, dynamic> json) =>
      _$AuthFromJson(json);  
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

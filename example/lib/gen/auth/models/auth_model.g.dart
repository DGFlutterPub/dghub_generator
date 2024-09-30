// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      email: json['email'] as String? ?? "example@gmail.com",
      token: AuthTokenModel.fromJson(json['token'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      deletedAt: json['deletedAt'] as String?,
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'email': instance.email,
      'token': instance.token.toJson(),
      'id': instance.id,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
    };

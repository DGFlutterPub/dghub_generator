// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      email: json['email'] as String? ?? "example@gmail.com",
      token: json['token'],
      createdAt: json['createdAt'] as String,
      deletedAt: json['deletedAt'] as String?,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'createdAt': instance.createdAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
    };

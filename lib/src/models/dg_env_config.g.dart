// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_env_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGEnvConfig _$DGEnvConfigFromJson(Map<String, dynamic> json) => DGEnvConfig(
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
      apiVersion: json['apiVersion'] as String? ?? 'v1',
      baseUrl: json['baseUrl'] as String? ?? 'http://127.0.0.1',
      devUrl: json['devUrl'] as String? ?? 'http://127.0.0.1',
      port: (json['port'] as num?)?.toInt() ?? 6001,
      socketVersion: json['socketVersion'] as String? ?? 'v1',
      production: json['production'] as bool? ?? false,
      publicKey: json['publicKey'] as String? ??
          'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa',
      secertKey: json['secertKey'] as String? ??
          'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe',
    );

Map<String, dynamic> _$DGEnvConfigToJson(DGEnvConfig instance) =>
    <String, dynamic>{
      'enabledGenerator': instance.enabledGenerator,
      'apiVersion': instance.apiVersion,
      'baseUrl': instance.baseUrl,
      'devUrl': instance.devUrl,
      'socketVersion': instance.socketVersion,
      'port': instance.port,
      'production': instance.production,
      'secertKey': instance.secertKey,
      'publicKey': instance.publicKey,
    };

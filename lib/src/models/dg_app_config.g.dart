// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGAppConfig _$DGAppConfigFromJson(Map<String, dynamic> json) => DGAppConfig(
    enabledGenerator: json['enabledGenerator'] as bool? ?? true,
    appName: json['appName'] as String? ?? 'Example (DG)',
    packageName: json['packageName'] as String? ?? 'dev.dghub.example',
    apiVersion: json['apiVersion'] as String? ?? 'v1',
    baseUrl: json['baseUrl'] as String? ?? 'http://127.0.0.1',
    devUrl: json['devUrl'] as String? ?? 'http://127.0.0.1',
    port: (json['port'] as num?)?.toInt() ?? 6001,
    socketVersion: json['socketVersion'] as String? ?? 'v1',
    production: json['production'] as bool? ?? false,
    secertKey: json['secertKey'] as String? ??
        'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe',
    publicKey: json['publicKey'] as String? ??
        'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa');

Map<String, dynamic> _$DGAppConfigToJson(DGAppConfig instance) =>
    <String, dynamic>{
      'enabledGenerator': instance.enabledGenerator,
      'appName': instance.appName,
      'packageName': instance.packageName,
      'apiVersion': instance.apiVersion,
      'baseUrl': instance.baseUrl,
      'devUrl': instance.devUrl,
      'socketVersion': instance.socketVersion,
      'port': instance.port,
      'production': instance.production,
      'secertKey': instance.secertKey,
      'publicKey': instance.publicKey
    };

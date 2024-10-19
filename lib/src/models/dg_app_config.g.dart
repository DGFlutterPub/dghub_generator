// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGAppConfig _$DGAppConfigFromJson(Map<String, dynamic> json) => DGAppConfig(
      appIcon: json['appIcon'] as String,
      appLogo: json['appLogo'] as String,
      appName: json['appName'] as String,
      packageName: json['packageName'] as String,
      apiVersion: json['apiVersion'] as String,
      baseUrl: json['baseUrl'] as String,
      devUrl: json['devUrl'] as String,
      port: (json['port'] as num).toInt(),
      socketVersion: json['socketVersion'] as String,
    );

Map<String, dynamic> _$DGAppConfigToJson(DGAppConfig instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'packageName': instance.packageName,
      'appLogo': instance.appLogo,
      'appIcon': instance.appIcon,
      'apiVersion': instance.apiVersion,
      'baseUrl': instance.baseUrl,
      'devUrl': instance.devUrl,
      'socketVersion': instance.socketVersion,
      'port': instance.port,
    };

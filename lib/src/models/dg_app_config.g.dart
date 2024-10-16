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
    );

Map<String, dynamic> _$DGAppConfigToJson(DGAppConfig instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'packageName': instance.packageName,
      'appLogo': instance.appLogo,
      'appIcon': instance.appIcon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGAppConfig _$DGAppConfigFromJson(Map<String, dynamic> json) => DGAppConfig(
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
      appName: json['appName'] as String? ?? 'Example (DG)',
      packageName: json['packageName'] as String? ?? 'dev.dghub.example',
    );

Map<String, dynamic> _$DGAppConfigToJson(DGAppConfig instance) =>
    <String, dynamic>{
      'enabledGenerator': instance.enabledGenerator,
      'appName': instance.appName,
      'packageName': instance.packageName,
    };

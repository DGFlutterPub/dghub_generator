// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_icon_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGIconConfig _$DGIconConfigFromJson(Map<String, dynamic> json) => DGIconConfig(
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
      android: json['android'] as bool? ?? true,
      ios: json['ios'] as bool? ?? true,
      web: json['web'] as bool? ?? true,
      linux: json['linux'] as bool? ?? true,
      macos: json['macos'] as bool? ?? true,
      window: json['window'] as bool? ?? true,
      allPath: json['allPath'] as String? ?? 'assets/images/icon.png',
      webPath: json['webPath'] as String? ?? 'assets/images/icon.png',
      androidPath: json['androidPath'] as String? ?? 'assets/images/icon.png',
      iosPath: json['iosPath'] as String? ?? 'assets/images/icon.png',
      linuxPath: json['linuxPath'] as String? ?? 'assets/images/icon.png',
      macosPath: json['macosPath'] as String? ?? 'assets/images/icon.png',
      windowPath: json['windowPath'] as String? ?? 'assets/images/icon.png',
    );

Map<String, dynamic> _$DGIconConfigToJson(DGIconConfig instance) =>
    <String, dynamic>{
      'android': instance.android,
      'androidPath': instance.androidPath,
      'web': instance.web,
      'webPath': instance.webPath,
      'ios': instance.ios,
      'iosPath': instance.iosPath,
      'macos': instance.macos,
      'macosPath': instance.macosPath,
      'linux': instance.linux,
      'linuxPath': instance.linuxPath,
      'window': instance.window,
      'windowPath': instance.windowPath,
      'allPath': instance.allPath,
      'enabledGenerator': instance.enabledGenerator,
    };

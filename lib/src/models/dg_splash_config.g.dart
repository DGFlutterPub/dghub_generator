// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_splash_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGSplashConfig _$DGSplashConfigFromJson(Map<String, dynamic> json) =>
    DGSplashConfig(
      fullScreeen: json['fullScreeen'] as bool? ?? true,
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
      android: json['android'] as bool? ?? true,
      ios: json['ios'] as bool? ?? true,
      web: json['web'] as bool? ?? true,
      linux: json['linux'] as bool? ?? true,
      macos: json['macos'] as bool? ?? true,
      window: json['window'] as bool? ?? true,
      allIconPath: json['allIconPath'] as String? ?? 'assets/images/icon.png',
      allBackgroundPath: json['allBackgroundPath'] as String?,
      allBackgroundColor: json['allBackgroundColor'] as String? ?? '#ffffff',
      allBackgroundColorDark:
          json['allBackgroundColorDark'] as String? ?? '#000000',
      webIconPath: json['webIconPath'] as String? ?? 'assets/images/icon.png',
      webBackgroundPath: json['webBackgroundPath'] as String?,
      webBackgroundColor: json['webBackgroundColor'] as String? ?? '#ffffff',
      webBackgroundColorDark:
          json['webBackgroundColorDark'] as String? ?? '#000000',
      androidIconPath:
          json['androidIconPath'] as String? ?? 'assets/images/icon.png',
      androidBackgroundPath: json['androidBackgroundPath'] as String?,
      androidBackgroundColor:
          json['androidBackgroundColor'] as String? ?? '#ffffff',
      androidBackgroundColorDark:
          json['androidBackgroundColorDark'] as String? ?? '#000000',
      iosIconPath: json['iosIconPath'] as String? ?? 'assets/images/icon.png',
      iosBackgroundPath: json['iosBackgroundPath'] as String?,
      iosBackgroundColor: json['iosBackgroundColor'] as String? ?? '#ffffff',
      iosBackgroundColorDark:
          json['iosBackgroundColorDark'] as String? ?? '#000000',
      linuxIconPath:
          json['linuxIconPath'] as String? ?? 'assets/images/icon.png',
      linuxBackgroundPath: json['linuxBackgroundPath'] as String?,
      linuxBackgroundColor:
          json['linuxBackgroundColor'] as String? ?? '#ffffff',
      linuxBackgroundColorDark:
          json['linuxBackgroundColorDark'] as String? ?? '#000000',
      macosIconPath:
          json['macosIconPath'] as String? ?? 'assets/images/icon.png',
      macosBackgroundPath: json['macosBackgroundPath'] as String?,
      macosBackgroundColor:
          json['macosBackgroundColor'] as String? ?? '#ffffff',
      macosBackgroundColorDark:
          json['macosBackgroundColorDark'] as String? ?? '#000000',
      windowIconPath:
          json['windowIconPath'] as String? ?? 'assets/images/icon.png',
      windowBackgroundPath: json['windowBackgroundPath'] as String?,
      windowBackgroundColor:
          json['windowBackgroundColor'] as String? ?? '#ffffff',
      windowBackgroundColorDark:
          json['windowBackgroundColorDark'] as String? ?? '#000000',
    );

Map<String, dynamic> _$DGSplashConfigToJson(DGSplashConfig instance) =>
    <String, dynamic>{
      'android': instance.android,
      'androidIconPath': instance.androidIconPath,
      'androidBackgroundPath': instance.androidBackgroundPath,
      'androidBackgroundColor': instance.androidBackgroundColor,
      'androidBackgroundColorDark': instance.androidBackgroundColorDark,
      'web': instance.web,
      'webIconPath': instance.webIconPath,
      'webBackgroundPath': instance.webBackgroundPath,
      'webBackgroundColor': instance.webBackgroundColor,
      'webBackgroundColorDark': instance.webBackgroundColorDark,
      'ios': instance.ios,
      'iosIconPath': instance.iosIconPath,
      'iosBackgroundPath': instance.iosBackgroundPath,
      'iosBackgroundColor': instance.iosBackgroundColor,
      'iosBackgroundColorDark': instance.iosBackgroundColorDark,
      'macos': instance.macos,
      'macosIconPath': instance.macosIconPath,
      'macosBackgroundPath': instance.macosBackgroundPath,
      'macosBackgroundColor': instance.macosBackgroundColor,
      'macosBackgroundColorDark': instance.macosBackgroundColorDark,
      'linux': instance.linux,
      'linuxIconPath': instance.linuxIconPath,
      'linuxBackgroundPath': instance.linuxBackgroundPath,
      'linuxBackgroundColor': instance.linuxBackgroundColor,
      'linuxBackgroundColorDark': instance.linuxBackgroundColorDark,
      'window': instance.window,
      'windowIconPath': instance.windowIconPath,
      'windowBackgroundPath': instance.windowBackgroundPath,
      'windowBackgroundColor': instance.windowBackgroundColor,
      'windowBackgroundColorDark': instance.windowBackgroundColorDark,
      'allIconPath': instance.allIconPath,
      'allBackgroundPath': instance.allBackgroundPath,
      'allBackgroundColor': instance.allBackgroundColor,
      'allBackgroundColorDark': instance.allBackgroundColorDark,
      'fullScreeen': instance.fullScreeen,
      'enabledGenerator': instance.enabledGenerator,
    };

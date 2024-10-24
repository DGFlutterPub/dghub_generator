import 'package:json_annotation/json_annotation.dart';

part 'dg_splash_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGSplashConfig {
  final bool android;
  final String androidIconPath;
  final String? androidBackgroundPath;
  final String androidBackgroundColor;
  final String androidBackgroundColorDark;
  final bool web;
  final String webIconPath;
  final String? webBackgroundPath;
  final String webBackgroundColor;
  final String webBackgroundColorDark;
  final bool ios;
  final String iosIconPath;
  final String? iosBackgroundPath;
  final String iosBackgroundColor;
  final String iosBackgroundColorDark;
  final bool macos;
  final String macosIconPath;
  final String? macosBackgroundPath;
  final String macosBackgroundColor;
  final String macosBackgroundColorDark;
  final bool linux;
  final String linuxIconPath;
  final String? linuxBackgroundPath;
  final String linuxBackgroundColor;
  final String linuxBackgroundColorDark;
  final bool window;
  final String windowIconPath;
  final String? windowBackgroundPath;
  final String windowBackgroundColor;
  final String windowBackgroundColorDark;
  final String allIconPath;
  final String? allBackgroundPath;
  final String allBackgroundColor;
  final String allBackgroundColorDark;
  final bool fullScreeen;
  final bool enabledGenerator;

  const DGSplashConfig({
    this.fullScreeen = true,
    this.enabledGenerator = true,
    this.android = true,
    this.ios = true,
    this.web = true,
    this.linux = true,
    this.macos = true,
    this.window = true,
    //
    this.allIconPath = 'assets/images/icon.png',
    this.allBackgroundPath,
    this.allBackgroundColor = '#ffffff',
    this.allBackgroundColorDark = '#000000',
    //
    this.webIconPath = 'assets/images/icon.png',
    this.webBackgroundPath,
    this.webBackgroundColor = '#ffffff',
    this.webBackgroundColorDark = '#000000',
    //
    this.androidIconPath = 'assets/images/icon.png',
    this.androidBackgroundPath,
    this.androidBackgroundColor = '#ffffff',
    this.androidBackgroundColorDark = '#000000',
    //
    this.iosIconPath = 'assets/images/icon.png',
    this.iosBackgroundPath,
    this.iosBackgroundColor = '#ffffff',
    this.iosBackgroundColorDark = '#000000',
    //
    this.linuxIconPath = 'assets/images/icon.png',
    this.linuxBackgroundPath,
    this.linuxBackgroundColor = '#ffffff',
    this.linuxBackgroundColorDark = '#000000',
    //
    this.macosIconPath = 'assets/images/icon.png',
    this.macosBackgroundPath,
    this.macosBackgroundColor = '#ffffff',
    this.macosBackgroundColorDark = '#000000',
    //
    this.windowIconPath = 'assets/images/icon.png',
    this.windowBackgroundPath,
    this.windowBackgroundColor = '#ffffff',
    this.windowBackgroundColorDark = '#000000',
  });

  factory DGSplashConfig.fromJson(Map<String, dynamic> json) =>
      _$DGSplashConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DGSplashConfigToJson(this);
}

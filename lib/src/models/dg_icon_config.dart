import 'package:json_annotation/json_annotation.dart';

part 'dg_icon_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGIconConfig {
  final bool android;
  final String androidPath;
  final bool web;
  final String webPath;
  final bool ios;
  final String iosPath;
  final bool macos;
  final String macosPath;
  final bool linux;
  final String linuxPath;
  final bool window;
  final String windowPath;
  final String allPath;
  final bool enabledGenerator;

  const DGIconConfig({
    this.enabledGenerator = true,
    this.android = true,
    this.ios = true,
    this.web = true,
    this.linux = true,
    this.macos = true,
    this.window = true,
    this.allPath = 'assets/images/icon.png',
    this.webPath = 'assets/images/icon.png',
    this.androidPath = 'assets/images/icon.png',
    this.iosPath = 'assets/images/icon.png',
    this.linuxPath = 'assets/images/icon.png',
    this.macosPath = 'assets/images/icon.png',
    this.windowPath = 'assets/images/icon.png',
  });

  factory DGIconConfig.fromJson(Map<String, dynamic> json) =>
      _$DGIconConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DGIconConfigToJson(this);
}

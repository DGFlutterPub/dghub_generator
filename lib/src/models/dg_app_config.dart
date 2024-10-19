import 'package:json_annotation/json_annotation.dart';
part 'dg_app_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGAppConfig {
  final String appName;
  final String packageName;
  final String appLogo;
  final String appIcon;
  final String apiVersion;
  final String baseUrl;
  final String devUrl;
  final String socketVersion;
  final int port;

  const DGAppConfig({
    required this.appIcon,
    required this.appLogo,
    required this.appName,
    required this.packageName,
    required this.apiVersion,
    required this.baseUrl,
    required this.devUrl,
    required this.port,
    required this.socketVersion,
  });

  factory DGAppConfig.fromJson(Map<String, dynamic> json) =>
      _$DGAppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGAppConfigToJson(this);
}

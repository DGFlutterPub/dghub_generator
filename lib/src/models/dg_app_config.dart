import 'package:json_annotation/json_annotation.dart';
part 'dg_app_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGAppConfig {
  final bool enabledGenerator;
  final String appName;
  final String packageName;
  final String apiVersion;
  final String baseUrl;
  final String devUrl;
  final String socketVersion;
  final int port;
  final bool production;

  const DGAppConfig({
    this.enabledGenerator = true,
    this.appName = 'Example (DG)',
    this.packageName = 'dev.dghub.example',
    this.apiVersion = 'v1',
    this.baseUrl = 'http://127.0.0.1',
    this.devUrl = 'http://127.0.0.1',
    this.port = 6001,
    this.socketVersion = 'v1',
    this.production = false,
  });

  factory DGAppConfig.fromJson(Map<String, dynamic> json) =>
      _$DGAppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGAppConfigToJson(this);
}

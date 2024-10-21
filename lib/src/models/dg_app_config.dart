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
  final String secertKey;
  final String publicKey;

  const DGAppConfig(
      {this.enabledGenerator = true,
      this.appName = 'Example (DG)',
      this.packageName = 'dev.dghub.example',
      this.apiVersion = 'v1',
      this.baseUrl = 'http://127.0.0.1',
      this.devUrl = 'http://127.0.0.1',
      this.port = 6001,
      this.socketVersion = 'v1',
      this.production = false,
      this.publicKey =
          'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa',
      this.secertKey =
          'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe'});

  factory DGAppConfig.fromJson(Map<String, dynamic> json) =>
      _$DGAppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGAppConfigToJson(this);
}

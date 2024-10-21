import 'package:json_annotation/json_annotation.dart';
part 'dg_env_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGEnvConfig {
  final bool enabledGenerator;
  final String apiVersion;
  final String baseUrl;
  final String devUrl;
  final String socketVersion;
  final int port;
  final bool production;
  final String secertKey;
  final String publicKey;

  const DGEnvConfig(
      {this.enabledGenerator = true,
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

  factory DGEnvConfig.fromJson(Map<String, dynamic> json) =>
      _$DGEnvConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGEnvConfigToJson(this);
}

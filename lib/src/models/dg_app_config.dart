import 'package:json_annotation/json_annotation.dart';
part 'dg_app_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGAppConfig {
  final bool enabledGenerator;
  final String appName;
  final String packageName;

  const DGAppConfig({
    this.enabledGenerator = true,
    this.appName = 'Example (DG)',
    this.packageName = 'dev.dghub.example',
  });

  factory DGAppConfig.fromJson(Map<String, dynamic> json) =>
      _$DGAppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGAppConfigToJson(this);
}

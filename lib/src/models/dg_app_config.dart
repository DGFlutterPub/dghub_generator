import 'package:json_annotation/json_annotation.dart';
part 'dg_app_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGAppConfig {
  final String appName;
  final String packageName;
  final String appLogo;
  final String appIcon;

  const DGAppConfig(
      {required this.appIcon,
      required this.appLogo,
      required this.appName,
      required this.packageName});

  factory DGAppConfig.fromJson(Map<String, dynamic> json) =>
      _$DGAppConfigFromJson(json);
  Map<String, dynamic> toJson() => _$DGAppConfigToJson(this);
}

enum DGAppConfigMethod { get, post, put, delete }

enum DGAppConfigAction {
  getOne,
  getAll,
  getOneRecovery,
  getAllRecovery,
  destroyForever,
  destroyAll,
  destroy,
  store,
  update
}

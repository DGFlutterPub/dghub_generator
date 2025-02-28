import 'package:json_annotation/json_annotation.dart';

part 'dg_generator_config.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGGeneratorConfig {
  final bool dart;
  final bool node;
  final bool python;
  final bool createdAt;
  final bool updatedAt;
  final bool deletedAt;
  final bool id;
  final bool language;
  final bool autoIncrement;
  final bool enabledGenerator;
  final bool saveLocalDatabase;
  final int paginationSize;
  final int itemLimit;

  const DGGeneratorConfig(
      {this.dart = true,
      this.node = true,
      this.python = true,
      this.createdAt = true,
      this.deletedAt = true,
      this.updatedAt = true,
      this.language = false,
      this.id = true,
      this.autoIncrement = false,
      this.enabledGenerator = true,
      this.saveLocalDatabase = false,
      this.itemLimit = 0,
      this.paginationSize = 20});

  factory DGGeneratorConfig.fromJson(Map<String, dynamic> json) =>
      _$DGGeneratorConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DGGeneratorConfigToJson(this);
}

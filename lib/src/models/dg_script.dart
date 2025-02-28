import 'package:json_annotation/json_annotation.dart';
part 'dg_script.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGScript {
  final String? import;
  final String? field;
  final String? init;
  final String? success;
  final String? error;
  final DGScriptType type;

  const DGScript(
      {this.import,
      this.init,
      this.success,
      this.error,
      this.field,
      this.type = DGScriptType.node});

  factory DGScript.fromJson(Map<String, dynamic> json) =>
      _$DGScriptFromJson(json);
  Map<String, dynamic> toJson() => _$DGScriptToJson(this);
}

enum DGScriptType { node, python }

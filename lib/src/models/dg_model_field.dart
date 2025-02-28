import 'dg_script.dart';
import 'dg_validate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dg_model_field.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGModelField {
  final String key;
  final dynamic defaultValue;
  final DGValidate validate;
  final List<String> forms;
  final dynamic ref;
  final bool store;
  final bool update;
  final bool loginForm;
  final bool findWithSearch;
  final List<DGScript> scripts;
  final bool findToGetValue;
  final bool findToGetValueToJson;
  final List<String> findQuery;
  const DGModelField(
      {required this.key,
      this.defaultValue,
      this.validate = const DGValidate(),
      this.forms = const [],
      this.ref,
      this.store = true,
      this.loginForm = false,
      this.update = true,
      this.findWithSearch = false,
      this.findToGetValue = false,
      this.findToGetValueToJson = false,
      this.findQuery = const [],
      this.scripts = const []});
  factory DGModelField.fromJson(Map<String, dynamic> json) =>
      _$DGModelFieldFromJson(json);
  Map<String, dynamic> toJson() => _$DGModelFieldToJson(this);
}

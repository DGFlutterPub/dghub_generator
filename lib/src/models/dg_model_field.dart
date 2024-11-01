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
  const DGModelField(
      {required this.key,
      this.defaultValue,
      this.validate = const DGValidate(),
      this.forms = const [],
      this.ref,
      this.store = true,
      this.update = true});
  factory DGModelField.fromJson(Map<String, dynamic> json) =>
      _$DGModelFieldFromJson(json);
  Map<String, dynamic> toJson() => _$DGModelFieldToJson(this);
}

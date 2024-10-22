import 'package:dghub_generator/dghub_generator.dart';

import 'dg_validate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dg_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGModel {
  final String key;
  final dynamic defaultValue;
  final DGValidate validate;
  final List<String> forms;
  final dynamic ref;
  final bool store;
  final bool update;
  const DGModel(
      {required this.key,
      this.defaultValue,
      this.validate = const DGValidate(),
      this.forms = const [],
      this.ref,
      this.store = true,
      this.update = true});
  factory DGModel.fromJson(Map<String, dynamic> json) =>
      _$DGModelFromJson(json);
  Map<String, dynamic> toJson() => _$DGModelToJson(this);
}

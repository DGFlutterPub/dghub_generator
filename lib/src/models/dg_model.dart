import 'package:dghub_generator/src/models/dg_validate.dart';

class DGModel {
  final String key;
  final dynamic type;
  final dynamic defaultValue;
  final DGValidate? validate;
  final bool form;
  final bool unique;
  const DGModel({
    required this.key,
    required this.type,
    this.defaultValue,
    this.validate,
    this.form = false,
    this.unique = false,
  });
}

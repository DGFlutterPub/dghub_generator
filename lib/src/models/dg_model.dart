import 'package:dghub_generator/src/models/dg_validate.dart';

class DGModel {
  final String key;
  final dynamic defaultValue;
  final DGValidate? validate;
  final bool form;
  final dynamic populate;
  const DGModel({
    required this.key,
    this.populate,
    this.defaultValue,
    this.validate,
    this.form = false,
  });
}

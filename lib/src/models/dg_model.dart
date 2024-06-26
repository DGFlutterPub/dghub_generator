import 'package:dghub_generator/src/models/dg_validate.dart';

class DGModel {
  final String key;
  final dynamic defaultValue;
  final DGValidate? validate;
  final bool form;
  final bool locationMode;

  const DGModel(
      {required this.key,
      this.defaultValue,
      this.validate,
      this.form = false,
      this.locationMode = false});
}

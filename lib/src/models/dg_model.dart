import 'package:dghub_generator/src/models/dg_validator.dart';

class DGModel {
  final String key;
  final dynamic defaultValue;
  final DGValidator? validator;

  const DGModel({
    required this.key,
    this.defaultValue,
    this.validator,
  });
}

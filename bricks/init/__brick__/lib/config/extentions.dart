import '../gen/dg_generator.dart';
import 'package:flutter/material.dart';

extension AppExtension on BuildContext {
  DGGenerator gen() => DGGenerator();
}

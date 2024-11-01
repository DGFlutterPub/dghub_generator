import 'dart:io';
import 'package:dghub_generator/dghub_generator.dart';

import 'package:mason/mason.dart';

import '../../bundles/module/dart/dart_module_bundle.dart';

class DartValidatorGenerator {
  static Future<void> generate(
      String className, List<DGModelField> models) async {
    final generator = await MasonGenerator.fromBundle(dartValidatorBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    await generator.generate(target, vars: {'name': className});
  }
}

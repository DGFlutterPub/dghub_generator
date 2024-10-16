import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';

class DartPaginationModelGenerator {
  static Future<void> generate(String className) async {
    final generator =
        await MasonGenerator.fromBundle(dartPaginationModelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    await generator.generate(target, vars: {
      'folder': className.toSnakeCase(),
      'name': className.toPlural().toSnakeCase()
    });
  }
}

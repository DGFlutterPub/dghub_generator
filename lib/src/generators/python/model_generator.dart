import 'dart:io';

import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:mason/mason.dart';
import '../../bundles/module/python/python_module_bundle.dart';
import '../../models/dg_model.dart';

class PythonModelGenerator {
  static Future<void> generate(
    String className,
    List<DGModel> models,
    DGGeneratorConfig? config,
  ) async {
    final generator = await MasonGenerator.fromBundle(pythonModelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    await generator.generate(target,
        vars: {'folder': 'python', 'code': 'py', 'name': className});
  }
}

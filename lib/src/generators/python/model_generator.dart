import 'dart:io';

import 'package:mason/mason.dart';
import '../../bundles/module/python/python_module_bundle.dart';
import '../../models/dg_config.dart';
import '../../models/dg_model.dart';

class PythonModelGenerator {
  static Future<void> generate(
    String className,
    List<DGModel> models,
    DGConfig? config,
  ) async {
    final generator = await MasonGenerator.fromBundle(pythonModelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    await generator.generate(target,
        vars: {'folder': 'python', 'code': 'py', 'name': className});
  }
}

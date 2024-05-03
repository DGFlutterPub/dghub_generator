import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/builders/model_builder.dart';
import 'package:dghub_generator/src/bundles/module_bundle.dart';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class ModelGenerator {
  static generate(String className, ConstantReader models) async {
    final generator = await MasonGenerator.fromBundle(modelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    generator.generate(target, vars: {'name': className});

    var result = ModelBuilder.get(
      name: className.toPascalCase(),
      models: models.listValue,
    );

    var file = File(
      p.join(
        Directory.current.path,
        'lib',
        'gen',
        className,
        'models',
        '${className}_model.dart',
      ),
    );

    await file.writeAsString(result);
  }
}

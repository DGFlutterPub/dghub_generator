import 'dart:io';

import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/builders/node/model_builder.dart';
import 'package:source_gen/source_gen.dart';
import 'package:path/path.dart' as p;

class ModelGenerator {
  static Future<void> generate(
    String className,
    ConstantReader models,
    DartObject? config,
    List<String> imports,
  ) async {
    var file = File(
      p.join(
        Directory.current.path,
        'node',
        'gen',
        className,
        'models',
        '${className}_model.js',
      ),
    );

    if (!file.existsSync()) file.createSync();

    var result = ModelBuilder(
      config: config,
      imports: imports,
      models: models.listValue,
      name: className.toPascalCase(),
    ).get();

    await file.writeAsString(result);
  }
}

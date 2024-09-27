import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/builders/validator_builder.dart';
import 'package:dghub_generator/src/bundles/module_bundle.dart';
import 'package:mason/mason.dart';
import 'package:source_gen/source_gen.dart';

class ValidatorGenerator {
  static Future<void> generate(String className, ConstantReader models) async {
    final generator = await MasonGenerator.fromBundle(validatorBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    generator.generate(target, vars: {'name': className});

    var result = ValidatorBuilder.get(
      name: className.toPascalCase(),
      models: models.listValue,
    );

    var file = File(
      p.join(
        Directory.current.path,
        'lib',
        'gen',
        className,
        'validators',
        '${className}_validator.dart',
      ),
    );

    await file.writeAsString(result);
  }
}

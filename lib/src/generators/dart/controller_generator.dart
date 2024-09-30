import 'dart:io';

import 'package:dghub_generator/src/builders/dart/controller_builder.dart';
import 'package:dghub_generator/src/bundles/module_bundle.dart';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

class ControllerGenerator {
  static generator(className, controller) async {
    final generator = await MasonGenerator.fromBundle(controllerBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    generator.generate(target, vars: {'name': className});

    var result = ControllerBuilder.get(
      name: className.toPascalCase(),
      controller: controller.listValue,
    );

    var file = File(
      p.join(
        Directory.current.path,
        'lib',
        'gen',
        className,
        'controller',
        '${className}_controller.dart',
      ),
    );

    await file.writeAsString(result);
  }
}

import 'dart:io';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/bundles/module_bundle.dart';
import 'package:dghub_generator/src/models/dg_socket.dart';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;
import 'package:source_gen/source_gen.dart';

class DGHubGenerator {
  final List<DGModel>? models;
  final DGController? controller;
  final DGSocket? socket;
  final List<DGPage>? pages;
  final DGConfig? config;

  const DGHubGenerator({
    this.config,
    this.models,
    this.controller,
    this.socket,
    this.pages,
  });
}

Builder getIsarGenerator(BuilderOptions options) => SharedPartBuilder(
      [
        _DGHUBGenerator(),
      ],
      'dghub_generator',
    );

class _DGHUBGenerator extends GeneratorForAnnotation<DGHubGenerator> {
  @override
  Future<void> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    var classObj = element as ClassElement;
    var className = classObj.name.replaceAll('Generator', '').toSnakeCase();

    final generator = await MasonGenerator.fromBundle(moduleBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    generator.generate(target, vars: {'name': className});

    var models = annotation.read('models');

    if (!models.isNull) {
      var model = _modelBuilder(
        name: className.toPascalCase(),
        models: models.listValue,
      );

      var modelFile = File(
        p.join(
          Directory.current.path,
          'lib',
          'app',
          className,
          'models',
          '${className}_model.dart',
        ),
      );

      await modelFile.writeAsString(model);
    }
  }

  String _modelBuilder({
    required String name,
    required List<DartObject> models,
  }) {
    var fields = <Field>[];
    var requiredParameters = <Parameter>[];
    var optionalParameters = <Parameter>[];

    for (var e in models) {
      var key = e.getField('key')!.toStringValue();
      var defaultValue = e.getField('defaultValue');

      var field = Field(
        (b) => b
          ..name = key
          ..type = Reference(defaultValue?.type.toString() ?? 'dynamic'),
      );
      fields.add(field);

      var parameter = Parameter(
        (b) => b
          ..name = key!
          ..toThis = true,
      );

      if (defaultValue?.isNull ?? true) {
        optionalParameters.add(parameter);
      } else {
        requiredParameters.add(parameter);
      }
    }

    var constructor = Constructor(
      (b) => b
        ..requiredParameters.addAll(requiredParameters)
        ..optionalParameters.addAll(optionalParameters),
    );

    var model = Class((b) => b
      ..name = '${name}Model'
      ..fields.addAll(fields)
      ..constructors.add(constructor));

    final emitter = DartEmitter();
    return DartFormatter().format('${model.accept(emitter)}');
  }
}

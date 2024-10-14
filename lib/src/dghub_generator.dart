// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/auto_convert.dart';
import 'package:source_gen/source_gen.dart';

import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/dart/model_generator.dart';
import 'package:dghub_generator/src/generators/dart/validator_generator.dart';
import 'package:dghub_generator/src/generators/node/node.dart' as node;

class DGHubGenerator {
  final List<DGModel>? models;
  final DGController? controller;
  final List<DGApiService>? apiServices;
  final List<DGPage>? pages;
  final DGConfig? config;

  const DGHubGenerator({
    this.config,
    this.models,
    this.controller,
    this.apiServices,
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
    var variables = getVariablesFromDartObject(annotation.objectValue);

    var map = parseData(
      variables: variables,
      object: annotation.objectValue,
    );

    print(jsonEncode(map));

    return;

    var classObj = element as ClassElement;
    var className = classObj.name.replaceAll('Generator', '').toSnakeCase();
    var config = annotation.read('config');
    var models = annotation.read('models');

    // var controller = annotation.read('controller');

    var importedLibraries = classObj.library.importedLibraries;
    var imports = importedLibraries.map((e) => e.identifier).toList();

    var config0 = config.isNull ? null : config.objectValue;

    // if (!models.isNull) {
    //   await ModelGenerator.generate(className, models, _config, imports);
    //   await ValidatorGenerator.generate(className, models);
    // }

    var isNode = config0?.getField('node')?.toBoolValue() ?? false;

    if (isNode) {
      await node.ModelGenerator.generate(className, models, config0, imports);
    }

    // if (!controller.isNull) {
    //   ControllerGenerator.generator(className, controller);
    // }
  }
}

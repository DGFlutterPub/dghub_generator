import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/dart/model_generator.dart';
import 'package:dghub_generator/src/generators/dart/validator_generator.dart';
import 'package:dghub_generator/src/generators/node/node.dart' as node;
import 'package:source_gen/source_gen.dart';

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
    var classObj = element as ClassElement;
    var className = classObj.name.replaceAll('Generator', '').toSnakeCase();
    var config = annotation.read('config');
    var models = annotation.read('models');
    // var controller = annotation.read('controller');

    var importedLibraries = classObj.library.importedLibraries;
    var imports = importedLibraries.map((e) => e.identifier).toList();

    var _config = config.isNull ? null : config.objectValue;

    // if (!models.isNull) {
    //   await ModelGenerator.generate(className, models, _config, imports);
    //   await ValidatorGenerator.generate(className, models);
    // }

    var isNode = _config?.getField('node')?.toBoolValue() ?? false;

    if (isNode) {
      await node.ModelGenerator.generate(className, models, _config, imports);
    }

    // if (!controller.isNull) {
    //   ControllerGenerator.generator(className, controller);
    // }
  }
}

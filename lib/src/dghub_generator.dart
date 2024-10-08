import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/node/node.dart' as node;
import 'package:dghub_generator/src/generators/dart/dart.dart' as dart;
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
    var mainConfig = annotation.read('config');
    var models = annotation.read('models');
    // var controller = annotation.read('controller');

    var importedLibraries = classObj.library.importedLibraries;
    var imports = importedLibraries.map((e) => e.identifier).toList();

    var config = mainConfig.isNull ? null : mainConfig.objectValue;

    if (!models.isNull) {
      var isNode = config?.getField('node')?.toBoolValue() ?? false;
      var isDart = config?.getField('dart')?.toBoolValue() ?? false;
      if (isDart) {
        await dart.ModelGenerator.generate(className, models, config, imports);
        await dart.ValidatorGenerator.generate(className, models);
      }
      if (isNode) {
        await node.ModelGenerator.generate(className, models, config, imports);
      }
    }

    // if (!controller.isNull) {
    //   ControllerGenerator.generator(className, controller);
    // }
  }
}

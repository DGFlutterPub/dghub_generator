import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/tools/auto_convert.dart';
import 'package:source_gen/source_gen.dart';
import 'generators/dart/api_generator.dart';
import 'generators/dart/form_generator.dart';
import 'generators/dart/model_generator.dart';
import 'generators/dart/validator_generator.dart';
import 'generators/node/api_generator.dart';
import 'generators/node/model_generator.dart';
import 'generators/python/model_generator.dart';

class DGHubGenerator {
  final List<DGModel>? models;
  final List<DGApi>? apis;
  final DGConfig? config;

  const DGHubGenerator({this.config, this.models, this.apis});
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
    var importedLibraries = classObj.library.importedLibraries;
    var imports = importedLibraries.map((e) => e.identifier).toList();
    var variables = getVariablesFromDartObject(annotation.objectValue);
    var anotations = parseData(
      variables: variables,
      object: annotation.objectValue,
    );

    print(anotations);

    var config = anotations.containsKey('config')
        ? DGConfig.fromJson(anotations['config'])
        : const DGConfig();

    //Model
    var models = anotations.containsKey('models')
        ? (anotations['models'] as List)
            .map((e) => DGModel.fromJson(e))
            .toList()
        : <DGModel>[];

    //Apis
    var apis = anotations.containsKey('apis')
        ? (anotations['apis'] as List).map((e) => DGApi.fromJson(e)).toList()
        : <DGApi>[];

    ///Model

    if (models.isNotEmpty) {
      if (config.dart) {
        await DartModelGenerator.generate(
          className,
          models,
          config,
        );
        await DartValidatorGenerator.generate(className, models);
        await DartFormGenerator.generate(className, models);
      }

      if (config.node) {
        await NodeModelGenerator.generate(className, models, config);
      }
      if (config.python) {
        await PythonModelGenerator.generate(className, models, config);
      }
    }

    ///Apis
    if (apis.isNotEmpty) {
      if (config.dart) {
        await DartApiGenerator.generate(className, models, config, apis);
      }
      if (config.node) {
        await NodeApiGenerator.generate(className, config, apis);
      }
      if (config.python) {}
    }
  }
}

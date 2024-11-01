import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/tools/auto_convert.dart';
import 'package:logger/logger.dart';
import 'package:source_gen/source_gen.dart';
import 'generators/dart/api_generator.dart';
import 'generators/dart/form_generator.dart';
import 'generators/dart/model_generator.dart';
import 'generators/dart/validator_generator.dart';
import 'generators/node/api_generator.dart';
import 'generators/node/model_generator.dart';
import 'generators/python/model_generator.dart';

class DGHubGenerator {
  final List<DGModelField>? model;
  final List<DGApi>? apis;
  final DGGeneratorConfig? config;

  const DGHubGenerator({this.config, this.model, this.apis});
}

Builder generator(BuilderOptions options) => SharedPartBuilder(
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
        ? DGGeneratorConfig.fromJson(anotations['config'])
        : const DGGeneratorConfig();

    //Model
    var models = anotations.containsKey('model')
        ? (anotations['model'] as List)
            .map((e) => DGModelField.fromJson(e))
            .toList()
        : <DGModelField>[];

    //Apis
    var apis = anotations.containsKey('apis')
        ? (anotations['apis'] as List).map((e) => DGApi.fromJson(e)).toList()
        : <DGApi>[];

    ///Model

    if (!config.enabledGenerator) return;

    if (models.isNotEmpty) {
      if (config.dart) {
        await DartModelGenerator.generate(
          className,
          models,
          config,
        );
        await DartValidatorGenerator.generate(className, models);
        await DartModelFormGenerator.generate(className, models, config);
      }

      if (config.node) {
        await NodeModelGenerator.generate(className, models, config);
      }
      if (config.python) {
        await PythonModelGenerator.generate(className, models, config);
      }
    }

    //Apis
    if (apis.isNotEmpty) {
      if (config.dart) {
        await DartApiGenerator.generate(className, models, config, apis);
      }
      if (config.node) {
        await NodeApiGenerator.generate(className, config, apis, models);
      }
      if (config.python) {}
    }
  }
}

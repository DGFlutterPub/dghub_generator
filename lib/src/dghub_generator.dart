import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/controller_generator.dart';
import 'package:dghub_generator/src/generators/model_generator.dart';
import 'package:dghub_generator/src/generators/validator_generator.dart';
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
    var models = annotation.read('models');
    var controller = annotation.read('controller');

    if (!models.isNull) {
      await ModelGenerator.generate(className, models);
      await ValidatorGenerator.generate(className, models);
    }

    // if (!controller.isNull) {
    //   ControllerGenerator.generator(className, controller);
    // }
  }
}

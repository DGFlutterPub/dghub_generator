import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';
import '../../models/dg_generator_config.dart';

class DartModelGenerator {
  static Future<void> generate(
    String className,
    List<DGModel> models,
    DGGeneratorConfig config,
  ) async {
    final generator = await MasonGenerator.fromBundle(dartModelBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var imports = [];
    var form = [];
    var formParameter = [];

    if (config.id) {
      formParameter.add('required this.id,');
      form.add('String id;');
    }

    if (config.autoIncrement) {
      formParameter.add('required this.autoIncrement,');
      form.add('int autoIncrement;');
    }

    if (config.createdAt) {
      formParameter.add('required this.createdAt,');
      form.add('String createdAt;');
    }

    if (config.updatedAt) {
      formParameter.add('this.updatedAt,');
      form.add('String? updatedAt;');
    }

    if (config.deletedAt) {
      formParameter.add('this.deletedAt,');
      form.add('String? deletedAt;');
    }

    if (config.language) {
      formParameter.add('this.language = "en",');
      form.add('String language;');
    }

    for (var model in models) {
      if (model.ref != null) {
        if (model.ref.toString().contains('List<')) {
          var name = model.ref
              .toString()
              .replaceFirst('List<', '')
              .replaceFirst('>', '')
              .toSnakeCase();
          imports.add('''import '../../$name/models/$name.dart';''');
        } else {
          imports.add(
              '''import '../../${model.ref.toString().toSnakeCase()}/models/${model.ref.toString().toSnakeCase()}.dart';''');
        }
      }

      if (model.ref == null) {
        formParameter.add(model.validate.isRequired == true
            ? 'required this.${model.key},'
            : model.defaultValue == null
                ? 'this.${model.key},'
                : 'this.${model.key} = ${Tools.dartDefaultValue(model)},');
      } else {
        formParameter.add('this.${model.key},');
      }

      if (model.validate.isFile) {
        form.add('String? ${model.key};');
      } else if (model.ref == null) {
        form.add(model.validate.isRequired == true
            ? '${Tools.dartType(model.validate)} ${model.key};'
            : model.defaultValue == null
                ? '${Tools.dartType(model.validate)}? ${model.key};'
                : '${Tools.dartType(model.validate)} ${model.key};');
      } else {
        form.add('${model.ref}? ${model.key};');
      }
    }
    var importsResult = Tools.getNewLineString(imports);
    var formResult = Tools.getNewLineString(form);
    var formParameterResult = Tools.getNewLineString(formParameter);

    read = read.replaceAll('/*import*/', importsResult);

    read = read.replaceAll('/*form*/', formResult);

    read = read.replaceAll('/*formParameter*/', formParameterResult);

    await file.writeAsString(read);
  }
}

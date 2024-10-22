import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/bundles/module/dart/dart_module_bundle.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';

import '../../models/dg_generator_config.dart';

class DartModelFormGenerator {
  static Future<void> generate(
      String className, List<DGModel> models, DGGeneratorConfig config) async {
    List<Map<String, String>> generatedPaths = [];

    for (var model in models) {
      for (var form in model.forms) {
        var file = File(
          p.join(
            Directory.current.path,
            'node',
            'gen',
            className,
            'forms',
            '${className}_${form}_form.js',
          ),
        );
        print(file.path);
        if (!await file.exists()) {
          final generator = await MasonGenerator.fromBundle(dartFormBundle);
          var target = DirectoryGeneratorTarget(Directory.current);
          var generated = await generator
              .generate(target, vars: {'form': form, 'name': className});

          generatedPaths.add({'form': form, 'path': generated.first.path});
        }
      }
    }

    for (var g in generatedPaths) {
      var f = File(g['path'] ?? '');

      var read = await f.readAsString();

      var form = [];
      var formData = [];
      var formParameter = [];

      for (var model in models) {
        if (model.forms.contains(g['form'])) {
          formParameter.add('this.${model.key},');

          form.add('${Tools.dartType(model.validate)}? ${model.key};');
          formData.add(
              '"${model.key}":  ${model.validate.isFile ? '${model.key} == null?null: await MultipartFile.fromFile(${model.key}!.path),' : '${model.key},'}');
        }

        if (model.validate.isFile && !read.contains("import 'dart:io';")) {
          read = read.replaceAll('/*import*/', "import 'dart:io';");
        }
      }
      var formResult = Tools.getNewLineString(form);
      var formParameterResult = Tools.getNewLineString(formParameter);
      var formDataResult = Tools.getNewLineString(formData);

      read = read.replaceAll('/*form*/', formResult);

      read = read.replaceAll('/*formParameter*/', formParameterResult);

      read = read.replaceAll('/*formData*/', formDataResult);

      await f.writeAsString(read);
    }
  }
}

class DartApiFormGenerator {
  static Future<void> generate(String className, List<DGModel> models,
      DGGeneratorConfig config, String form, DGApi api) async {
    if (!api.enabledForm) return;

    final generator = await MasonGenerator.fromBundle(dartFormBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator
        .generate(target, vars: {'form': form, 'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var forms = [];
    var formData = [];
    var formParameter = [];

    for (var model in models) {
      formParameter.add('this.${model.key},');

      forms.add('${Tools.dartType(model.validate)}? ${model.key};');
      formData.add(
          '"${model.key}":  ${model.validate.isFile ? '${model.key} == null?null: await MultipartFile.fromFile(${model.key}!.path),' : '${model.key},'}');

      if (model.validate.isFile && !read.contains("import 'dart:io';")) {
        read = read.replaceAll('/*import*/', "import 'dart:io';");
      }
    }
    var formResult = Tools.getNewLineString(forms);
    var formParameterResult = Tools.getNewLineString(formParameter);
    var formDataResult = Tools.getNewLineString(formData);

    read = read.replaceAll('/*form*/', formResult);

    read = read.replaceAll('/*formParameter*/', formParameterResult);

    read = read.replaceAll('/*formData*/', formDataResult);

    await file.writeAsString(read);
  }
}

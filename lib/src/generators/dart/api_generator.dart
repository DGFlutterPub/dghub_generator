import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/dart/form_generator.dart';
import 'package:dghub_generator/src/generators/dart/provider_generator.dart';
import 'package:dghub_generator/src/generators/dart/pagination_model_generator.dart';
import 'package:dghub_generator/src/generators/dart/query_model_generator.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/dart/dart_module_bundle.dart';

class DartApiGenerator {
  static Future<void> generate(
    String className,
    List<DGModel> models,
    DGConfig config,
    List<DGApi> apis,
  ) async {
    final generator = await MasonGenerator.fromBundle(dartApiBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var import = [];
    var body = [];

    for (var api in apis) {
      if (api.action == DGApiAction.store) {
        await DartProviderGenerator.generate(className, api.action.name);
        await DartApiFormGenerator.generate(
            className, models, config, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
  Future<${className.toPascalCase()}> store({required FormData form}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.toSnakeCase()}',data: form);
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.update) {
        await DartProviderGenerator.generate(className, api.action.name);
        await DartApiFormGenerator.generate(
            className, models, config, api.action.name);

        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> update({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}/\$id',data: form);
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroy) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> destroy({required String id}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}/\$id');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyAll) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> destroyAll() async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase.toPlural()}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyForever) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> destroyForever({required String id}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}_forever_destroy/\$id');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getOne) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> getOne({required String id}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}/\$id');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getAll) {
        await DartPaginationModelGenerator.generate(className);
        await DartQueryModelGenerator.generate(className, models);
        await DartProviderGenerator.generate(className, api.action.name);

        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        if (!import.contains(
            "import '../models/${className.toSnakeCase()}_query.dart';")) {
          import
              .add("import '../models/${className.toSnakeCase()}_query.dart';");
        }
        if (!import.contains(
            "import '../models/${className.toSnakeCase().toPlural()}.dart';")) {
          import.add(
              "import '../models/${className.toSnakeCase().toPlural()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase().toPlural()}> getAll({${className.toPascalCase()}Query? query}) async {
    try {
      var response = await ApiService.request().${api.method.name}(
      '/${className.toSnakeCase().toPlural()}',
      queryParameters: query?.toJson()
      );
      return ${className.toPascalCase().toPlural()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getAllRecovery) {
        await DartPaginationModelGenerator.generate(className);
        await DartQueryModelGenerator.generate(className, models);
        await DartProviderGenerator.generate(className, api.action.name);

        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        if (!import.contains(
            "import '../models/${className.toSnakeCase()}_query.dart';")) {
          import
              .add("import '../models/${className.toSnakeCase()}_query.dart';");
        }
        if (!import.contains(
            "import '../models/${className.toSnakeCase().toPlural()}.dart';")) {
          import.add(
              "import '../models/${className.toSnakeCase().toPlural()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase().toPlural()}> getAllRecovery({${className.toPascalCase()}Query? query}) async {
    try {
      var response = await ApiService.request().${api.method.name}(
      '/${className.toSnakeCase().toPlural()}',
      queryParameters: query?.toJson()
      );
      return ${className.toPascalCase().toPlural()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getOneRecovery) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> getOneRecovery({required String id}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}_recovery/\$id');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverOne) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> recoverOne({required String id}) async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase}_recover/\$id');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverAll) {
        await DartProviderGenerator.generate(className, api.action.name);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> recoverAll() async {
    try {
      var response = await ApiService.request().${api.method.name}('/${className.snakeCase.toPlural()}_recover');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }
    }

    var importResult = Tools.getNewLineString(import);
    var bodyParameterResult = Tools.getNewLineString(body);

    read = read.replaceAll('/*import*/', importResult);

    read = read.replaceAll('/*body*/', bodyParameterResult);

    await file.writeAsString(read);
  }
}

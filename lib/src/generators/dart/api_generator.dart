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
      var baseOption = api.url == null
          ? ""
          : '''option: BaseOptions(baseUrl: "${api.url}")''';

      var pathName =
          api.path?.replaceAll('/', '_').toPascalCase().toSnakeCase();

      if (api.action == DGApiAction.store) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
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
  Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'store'}({required FormData form}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.toSnakeCase()}' : '/${pathName.snakeCase}'}' ,data: form);
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.update) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
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
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'update'}({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.toSnakeCase()}/\$id' : '/${pathName.snakeCase}/\$id'}' ,data: form);
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroy) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'destroy'}({required String id}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.toSnakeCase()}/\$id' : '/${pathName.snakeCase}/\$id'}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyAll) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'destroyAll'}() async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.toSnakeCase()}' : '/${api.path!.snakeCase}'}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyForever) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'destroyForever'}({required String id}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.snakeCase}_forever_destroy/\$id' : '/${pathName.snakeCase}_forever_destroy/\$id'}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getOne) {
        print(className);
        print(pathName);
        print(api.action.name);

        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'getOne'}({required String id}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.snakeCase}/\$id' : '/${pathName.snakeCase}/\$id'}');
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
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);

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
Future<${className.toPascalCase().toPlural()}> ${pathName?.toCamelCase() ?? 'getAll'}({${className.toPascalCase()}Query? query}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}(
      '${pathName == null ? '/${className.toSnakeCase().toPlural()}' : '/${pathName.toSnakeCase().toPlural()}'}',
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
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);

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
Future<${className.toPascalCase().toPlural()}> ${pathName?.toCamelCase() ?? 'getAllRecovery'}({${className.toPascalCase()}Query? query}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}(
     '${pathName == null ? '/${className.toSnakeCase().toPlural()}' : '/${pathName.toSnakeCase().toPlural()}'}',
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
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'getOneRecovery'}({required String id}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.snakeCase}_recovery/\$id' : '/${pathName.snakeCase}_recovery/\$id'}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverOne) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'recoverOne'}({required String id}) async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.snakeCase}_recover/\$id' : '/${pathName.snakeCase}_recover/\$id'}');
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverAll) {
        await DartProviderGenerator.generate(
            className, pathName ?? api.action.name, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${pathName?.toCamelCase() ?? 'recoverAll'}() async {
    try {
      var response = await ApiService.request($baseOption).${api.method.name}('${pathName == null ? '/${className.snakeCase.toPlural()}_recover' : '/${pathName.snakeCase.toPlural()}_recover'}');
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

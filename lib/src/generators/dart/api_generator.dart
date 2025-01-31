import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/dart/form_generator.dart';
import 'package:dghub_generator/src/generators/dart/provider_generator.dart';
import 'package:dghub_generator/src/generators/dart/pagination_model_generator.dart';
import 'package:dghub_generator/src/generators/dart/provider_prerefresh_generator.dart';
import 'package:dghub_generator/src/generators/dart/query_model_generator.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/dart/dart_module_bundle.dart';
import 'socket_generator.dart';

class DartApiGenerator {
  static Future<void> generate(
    String className,
    List<DGModelField> models,
    DGGeneratorConfig config,
    List<DGApi> apis,
  ) async {
    final generator = await MasonGenerator.fromBundle(dartApiBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    await DartSocketGenerator.generate(className, models, config, apis);

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var import = [];
    var body = [];

    for (var api in apis) {
      var classPathName = Tools.getClassPathName(className, api);

      var baseOption = api.url == null
          ? ""
          : '''option: BaseOptions(baseUrl: "${api.url}")''';

      if (api.action == DGApiAction.store ||
          api.action == DGApiAction.login ||
          api.action == DGApiAction.register ||
          api.action == DGApiAction.forgotPasswordSend ||
          api.action == DGApiAction.emailVerificationSend) {
        await DartProviderGenerator.generate(className, api);
        await DartApiFormGenerator.generate(
            className, models, config, api.action.name, api);

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
  Future<${api.action == DGApiAction.forgotPasswordSend ? 'bool' : className.toPascalCase()}> ${classPathName.toCamelCase()}({required FormData form}) async {
    var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}' ,data: form);
    try {  
      return ${api.action == DGApiAction.forgotPasswordSend ? 'response.data;' : '${className.toPascalCase()}.fromJson(response.data);'}
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.profile) {
        await DartProviderGenerator.generate(className, api);
        await DartApiFormGenerator.generate(
            className, models, config, api.action.name, api);

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
  Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}() async {
    var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}');
    try {  
      return ${api.action == DGApiAction.forgotPasswordSend ? 'response.data;' : '${className.toPascalCase()}.fromJson(response.data);'}
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.update ||
          api.action == DGApiAction.forgotPasswordUpdate ||
          api.action == DGApiAction.emailVerificationUpdate) {
        await DartProviderGenerator.generate(className, api);
        await DartApiFormGenerator.generate(
            className, models, config, api.action.name, api);

        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id, required FormData form}) async {
   var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}/\$id' ,data: form);
    try {
       return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroy) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id}) async {
    var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}/\$id');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyAll) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}() async {
    var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.destroyForever) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }
        if (!import.contains("import 'package:dio/dio.dart';")) {
          import.add("import 'package:dio/dio.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id}) async {
   var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}/\$id');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getOne) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id}) async {
   var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}/\$id');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getAll) {
        await DartPaginationModelGenerator.generate(className);
        await DartQueryModelGenerator.generate(className, models);
        await DartProviderGenerator.generate(className, api);

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
Future<${className.toPascalCase().toPlural()}> ${classPathName.toCamelCase()}({${className.toPascalCase()}Query? query}) async {
      var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.toSnakeCase().toPlural()}',
      queryParameters: query?.toJson()
      );
    try {
      return ${className.toPascalCase().toPlural()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getAllRecovery) {
        await DartPaginationModelGenerator.generate(className);
        await DartQueryModelGenerator.generate(className, models);
        await DartProviderGenerator.generate(className, api);

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
Future<${className.toPascalCase().toPlural()}> ${classPathName.toCamelCase()}({${className.toPascalCase()}Query? query}) async {
     var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.toSnakeCase().toPlural()}',
      queryParameters: query?.toJson()
      );
    try {
      return ${className.toPascalCase().toPlural()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.getOneRecovery) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id}) async {
     var response = await ApiService.request($baseOption).${api.method.name}( '/${classPathName.snakeCase}/\$id');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverOne) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}({required String id}) async {
   var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase}/\$id');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
    }
  }
''');
      }

      if (api.action == DGApiAction.recoverAll) {
        await DartProviderGenerator.generate(className, api);
        if (!import
            .contains("import '../models/${className.toSnakeCase()}.dart';")) {
          import.add("import '../models/${className.toSnakeCase()}.dart';");
        }

        body.add('''
Future<${className.toPascalCase()}> ${classPathName.toCamelCase()}() async {
   var response = await ApiService.request($baseOption).${api.method.name}('/${classPathName.snakeCase.toPlural()}');
    try {
      return ${className.toPascalCase()}.fromJson(response.data);
    } catch (e, s) {
      throw response.data.toString();
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

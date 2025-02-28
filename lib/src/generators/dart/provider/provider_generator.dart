import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/destroy_all_forever_provider.dart'
    show dartDestroyAllForeverProviderScript;
import 'package:dghub_generator/src/generators/dart/provider/scripts/destroy_all_provider.dart'
    show dartDestroyAllProviderScript;
import 'package:dghub_generator/src/generators/dart/provider/scripts/destroy_forerver_provider.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/destroy_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/get_all_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/get_one_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/get_one_recovery_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/login_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/profile_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/register_provider_script.dart';
import 'package:dghub_generator/src/generators/dart/provider/scripts/store_provider_script.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../../../dghub_generator.dart';
import '../../../bundles/module/dart/dart_module_bundle.dart';
import '../provider_prerefresh_generator.dart';

class DartProviderGenerator {
  static Future<void> generate(String className, DGApi api) async {
    var classPathName = Tools.getClassPathName(className, api);

    final generator = await MasonGenerator.fromBundle(dartProviderBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {
      'name': className.toSnakeCase(),
      'action': classPathName.toSnakeCase()
    });

    var file = File(generated.first.path);
    var result = '';

    if (api.action == DGApiAction.store) {
      result = dartStoreProviderScript(className, classPathName, api);
    }
    if (api.action == DGApiAction.login) {
      result = dartLoginProviderScript(className, classPathName, api);
    }
    if (api.action == DGApiAction.register) {
      result = dartRegisterProviderScript(className, classPathName, api);
    }
    if (api.action == DGApiAction.forgotPasswordSend) {}
    if (api.action == DGApiAction.emailVerificationSend) {}

    if (api.action == DGApiAction.forgotPasswordSend ||
        api.action == DGApiAction.emailVerificationSend) {
      var modelClass = api.action == DGApiAction.forgotPasswordSend
          ? 'bool'
          : className.toPascalCase();

      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';
import '../sockets/${className.toSnakeCase()}_socket.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<$modelClass>?>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<$modelClass>?> {
   ${classPathName.toPascalCase()}Notifier() : super(null);
  
  final _api = ${className.toPascalCase()}Api();
  final _socket = ${className.toPascalCase()}Socket();

  ${classPathName.toCamelCase()}({required FormData form}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }

  ${classPathName.toCamelCase()}RealTimeListening() {
    _socket.${api.action.name}(result: (data) {
      state = AsyncData(data);
    });
  }

}''';
    }

    if (api.action == DGApiAction.profile) {
      result = dartProfileProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.update ||
        api.action == DGApiAction.forgotPasswordUpdate ||
        api.action == DGApiAction.emailVerificationUpdate) {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>?>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>?> {
   ${classPathName.toPascalCase()}Notifier() : super(null);
  
  final _api = ${className.toPascalCase()}Api();

  ${classPathName.toCamelCase()}({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(form: form,id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.getOne) {
      result = dartGetOneProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.destroy) {
      result = dartDestroyProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.destroyForever) {
      result = dartDestroyForeveryProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.destroyAll) {
      result = dartDestroyAllProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.destroyAllForever) {
      result =
          dartDestroyAllForeverProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.getAll) {
      if (api.preRefresh && !api.autoDispose) {
        await DartProviderPreRefreshGenerator.generate(
            className, classPathName.toSnakeCase().toPlural());
      }

      result = dartGetAllProviderScript(className, classPathName, api);
    }

    if (api.action == DGApiAction.getOneRecovery) {
      result = dartGetOneRecoveryProviderScript(className, classPathName, api);
    }

    await file.writeAsString(result);
  }
}

import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../../dghub_generator.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';
import 'provider_prerefresh_generator.dart';

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

    if (api.action == DGApiAction.store ||
        api.action == DGApiAction.login ||
        api.action == DGApiAction.register ||
        api.action == DGApiAction.forgotPasswordSend ||
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
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${classPathName.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  refresh() {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}().then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
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
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${classPathName.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  refresh({required String id}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.destroy) {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${classPathName.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.destroyForever) {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${classPathName.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.getAll) {
      if (api.preRefresh && !api.autoDispose) {
        await DartProviderPreRefreshGenerator.generate(
            className, classPathName.toSnakeCase().toPlural());
      }

      result = '''
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../models/${className.toSnakeCase().toPlural()}.dart';
import '../models/${className.toSnakeCase()}_query.dart';
import '../apis/${className.toSnakeCase()}_api.dart';
import '../../../system/states/pagination_state.dart';

var ${classPathName.toCamelCase().toPlural()}Provider = StateNotifierProvider<${classPathName.toPascalCase().toPlural()}Notifier, PaginationState<${classPathName.toPascalCase().toPlural()}>>(
        (ref) => ${classPathName.toPascalCase().toPlural()}Notifier());



class ${classPathName.toPascalCase().toPlural()}Notifier extends  StateNotifier<PaginationState<${classPathName.toPascalCase().toPlural()}>> {
 ${classPathName.toPascalCase().toPlural()}Notifier() : super(PaginationLoading());
  
  final _api = ${className.toPascalCase()}Api();
  ${className.toPascalCase()}Query query = ${className.toPascalCase()}Query();
  
  
  refresh() {
    query.page = 1;
      state = PaginationLoading();
    _api.${classPathName.toCamelCase()}(query:query).then((response) {
     state = PaginationSuccess(response);
    }).onError((e, s) {
     state = PaginationFailed(e.toString());
    });
  }

  loadMore() {
    query.page++;
    state = PaginationLoadMoreLoading();
    _api.${classPathName.toCamelCase()}(query:query).then((response) {
   if (response.data.isNotEmpty) {
        state.value?.data = [...state.value?.data ?? [], ...response.data];
        state = PaginationSuccess(state.value);
      }
      state = PaginationLoadMoreSuccess();
     
    }).onError((e, s) {
      state = PaginationLoadMoreFailed(e.toString());
    });
  }

  destroy({required String id}) {
    state.value?.data.removeWhere((e) => e.id == id);
    state = PaginationSuccess(state.value);
    
  }

  store({required ${className.toPascalCase()} data}) {
      state.value?.data = [data, ...state.value?.data ?? []];
      state = PaginationSuccess(state.value);

  }

  update({required ${className.toPascalCase()} data}) {
    state.value?.data[state.value!.data.indexWhere((e) => e.id == data.id)] = data;
   state = PaginationSuccess(state.value);
  }
}
''';
    }

    if (api.action == DGApiAction.getOneRecovery) {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase()}Provider = StateNotifierProvider<
    ${classPathName.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${classPathName.toPascalCase()}Notifier());

class ${classPathName.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${classPathName.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  refresh({required String id}) {
    state = const AsyncLoading();
    _api.${classPathName.toCamelCase()}(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    await file.writeAsString(result);
  }
}

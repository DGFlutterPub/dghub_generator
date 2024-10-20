import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../../dghub_generator.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';

class DartProviderGenerator {
  static Future<void> generate(
      String className, String actionName, DGApi api) async {
    var pathName = api.path?.replaceAll('/', '_').toPascalCase().toSnakeCase();

    var classPathName = switch (actionName) {
      'getOne' => className,
      'getAll' => className.toPlural(),
      'store' => '${className}_store',
      'update' => '${className}_update',
      'destroy' => '${className}_destroy',
      'destroyAll' => '${className.toPlural()}_destroy',
      'destroyForever' => '${className}_destroy_forever',
      'recoverOne' => '${className}_recover',
      'recoverAll' => '${className.toPlural()}_recover',
      'getOneRecovery' => '${className}_recovery',
      'getAllRecovery' => '${className.toPlural()}_recovery',
      _ =>
        pathName == null ? className : '${className}_$pathName'.toSnakeCase(),
    };

    print(className);
    print(classPathName);
    print(pathName);

    final generator = await MasonGenerator.fromBundle(dartProviderBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator
        .generate(target, vars: {'name': className, 'action': classPathName});

    var file = File(generated.first.path);
    var result = '';

    if (api.action == DGApiAction.store) {
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

  ${actionName.toCamelCase()}({required FormData form}) {
    state = const AsyncLoading();
    _api.${actionName.toCamelCase()}(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.update) {
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

  ${actionName.toCamelCase()}({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.${actionName.toCamelCase()}(form: form,id: id).then((response) {
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
    _api.${actionName.toCamelCase()}(id: id).then((response) {
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
    _api.${actionName.toCamelCase()}(id: id).then((response) {
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
    _api.${actionName.toCamelCase()}(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (api.action == DGApiAction.getAll) {
      result = '''
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../models/${className.toSnakeCase().toPlural()}.dart';
import '../models/${className.toSnakeCase()}_query.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${classPathName.toCamelCase().toPlural()}Provider = ChangeNotifierProvider<${classPathName.toPascalCase().toPlural()}Notifier>((ref) => ${classPathName.toPascalCase().toPlural()}Notifier());

class ${classPathName.toPascalCase().toPlural()}Notifier extends ChangeNotifier {
  AsyncValue<${classPathName.toPascalCase().toPlural()}?> state = const AsyncLoading();
  AsyncValue<bool> loadMoreState = const AsyncData(false);
  final _api = ${className.toPascalCase()}Api();
  ${className.toPascalCase()}Query query = ${className.toPascalCase()}Query();
  
  
  refresh() {
    query.page = 1;
    state = const AsyncLoading();
    _api.${actionName.toCamelCase()}(query:query).then((response) {
      state = AsyncData(response);
      notifyListeners();
    }).onError((e, s) {
      state = AsyncError(e!, s);
      notifyListeners();
    });
  }

  loadMore() {
    query.page++;
    loadMoreState = const AsyncLoading();
    _api.${actionName.toCamelCase()}(query:query).then((response) {
      if (response.data.isNotEmpty) {
        state.value?.data = [...state.value?.data ?? [], ...response.data];
        state = AsyncData(state.value);
        loadMoreState = const AsyncData(true);
      } else {
        loadMoreState = const AsyncData(false);
      }
      notifyListeners();
    }).onError((e, s) {
      loadMoreState = AsyncError(e!, s);
      notifyListeners();
    });
  }

  destroy({required String id}) {
    state.value?.data.removeWhere((e) => e.id == id);
    state = AsyncData(state.value);
    notifyListeners();
  }

  store({required ${className.toPascalCase()} data}) {
      state.value?.data = [data, ...state.value?.data ?? []];
      state = AsyncData(state.value);
    notifyListeners();
  }

  update({required ${className.toPascalCase()} data}) {
    state.value?.data[state.value!.data.indexWhere((e) => e.id == data.id)] = data;
    state = AsyncData(state.value);
    notifyListeners();
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
    _api.${actionName.toCamelCase()}(id: id).then((response) {
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

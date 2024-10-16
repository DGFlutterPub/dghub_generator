import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';
import '../../bundles/module/dart/dart_module_bundle.dart';

class DartProviderGenerator {
  static Future<void> generate(String className, String actionName) async {
    final generator = await MasonGenerator.fromBundle(dartProviderBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {
      'name': className,
      'action': switch (actionName) {
        'getOne' => className,
        'getAll' => className.toPlural(),
        'store' => '${className}_store',
        'update' => '${className}_update',
        'destroy' => '${className}_destroy',
        'destroyForever' => '${className}_destroy_forever',
        _ => className
      }
    });

    var file = File(generated.first.path);
    var result = '';

    if (actionName == 'store') {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}StoreProvider = StateNotifierProvider<
    ${className.toPascalCase()}StoreNotifier,
    AsyncValue<${className.toPascalCase()}>?>((ref) => ${className.toPascalCase()}StoreNotifier());

class ${className.toPascalCase()}StoreNotifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>?> {
   ${className.toPascalCase()}StoreNotifier() : super(null);
  
  final _api = ${className.toPascalCase()}Api();

  store({required FormData form}) {
    state = const AsyncLoading();
    _api.store(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (actionName == 'update') {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}UpdateProvider = StateNotifierProvider<
    ${className.toPascalCase()}UpdateNotifier,
    AsyncValue<${className.toPascalCase()}>?>((ref) => ${className.toPascalCase()}UpdateNotifier());

class ${className.toPascalCase()}UpdateNotifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>?> {
   ${className.toPascalCase()}UpdateNotifier() : super(null);
  
  final _api = ${className.toPascalCase()}Api();

  update({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.update(form: form,id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (actionName == 'getOne') {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}Provider = StateNotifierProvider<
    ${className.toPascalCase()}Notifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${className.toPascalCase()}Notifier());

class ${className.toPascalCase()}Notifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${className.toPascalCase()}Notifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  refresh({required String id}) {
    state = const AsyncLoading();
    _api.getOne(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (actionName == 'destroy') {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}DestroyProvider = StateNotifierProvider<
    ${className.toPascalCase()}DestroyNotifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${className.toPascalCase()}DestroyNotifier());

class ${className.toPascalCase()}DestroyNotifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${className.toPascalCase()}DestroyNotifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.destroy(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (actionName == 'destroyForever') {
      result = '''
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}DestroyForeverProvider = StateNotifierProvider<
    ${className.toPascalCase()}DestroyForeverNotifier,
    AsyncValue<${className.toPascalCase()}>>((ref) => ${className.toPascalCase()}DestroyForeverNotifier());

class ${className.toPascalCase()}DestroyForeverNotifier extends StateNotifier<AsyncValue<${className.toPascalCase()}>> {
   ${className.toPascalCase()}DestroyForeverNotifier() : super(const AsyncLoading());
  
  final _api = ${className.toPascalCase()}Api();

  destroy({required String id}) {
    state = const AsyncLoading();
    _api.destroyForever(id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}''';
    }

    if (actionName == 'getAll') {
      result = '''
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/${className.toSnakeCase()}.dart';
import '../models/${className.toSnakeCase().toPlural()}.dart';
import '../models/${className.toSnakeCase()}_query.dart';
import '../apis/${className.toSnakeCase()}_api.dart';

var ${className.toCamelCase()}Provider = ChangeNotifierProvider<${className.toPascalCase()}Notifier>((ref) => ${className.toPascalCase()}Notifier());

class ${className.toPascalCase()}Notifier extends ChangeNotifier {
  AsyncValue<${className.toPascalCase().toPlural()}?> state = const AsyncLoading();
  AsyncValue<bool> loadMoreState = const AsyncData(false);
  final _api = ProductApi();
  ${className.toPascalCase()}Query query = ${className.toPascalCase()}Query();
  
  
  refresh() {
    query.page = 1;
    state = const AsyncLoading();
    _api.getAll(query:query).then((response) {
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
    _api.getAll(query:query).then((response) {
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

    await file.writeAsString(result);
  }
}

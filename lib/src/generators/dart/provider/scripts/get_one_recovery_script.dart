import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_api.dart';

String dartGetOneRecoveryProviderScript(
    String className, String classPathName, DGApi api) {
  return '''
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

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_api.dart';

String dartLoginProviderScript(
    String className, String classPathName, DGApi api) {
  var modelClass = className.toPascalCase();

  return '''
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

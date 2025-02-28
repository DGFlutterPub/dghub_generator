import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_api.dart';
import 'package:dghub_generator/src/tools/tools.dart';

String dartGetAllProviderScript(
    String className, String classPathName, DGApi api) {
  return '''
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

   destroyAll() {
    state.value?.data = [];
    state = PaginationSuccess(state.value);
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

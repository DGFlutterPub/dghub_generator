// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGApi _$DGApiFromJson(Map<String, dynamic> json) => DGApi(
      url: json['url'] as String?,
      method: $enumDecode(_$DGApiMethodEnumMap, json['method']),
      action: $enumDecode(_$DGApiActionEnumMap, json['action']),
      realTime: json['realTime'] as bool? ?? false,
      autoDispose: json['autoDispose'] as bool? ?? false,
      preRefresh: json['preRefresh'] as bool? ?? false,
      authenticated: json['authenticated'] as bool? ?? false,
      controlAuthenticatedOnly:
          json['controlAuthenticatedOnly'] as bool? ?? false,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      headers: (json['headers'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      path: json['path'] as String?,
      enabledForm: json['enabledForm'] as bool? ?? true,
      saveToLocalStorage: json['saveToLocalStorage'] as bool? ?? false,
      getOneKey: json['getOneKey'] as String? ?? 'id',
      scripts: (json['scriptss'] as List<dynamic>?)
              ?.map((e) => DGScript.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DGApiToJson(DGApi instance) => <String, dynamic>{
      'url': instance.url,
      'path': instance.path,
      'method': _$DGApiMethodEnumMap[instance.method]!,
      'action': _$DGApiActionEnumMap[instance.action]!,
      'realTime': instance.realTime,
      'autoDispose': instance.autoDispose,
      'preRefresh': instance.preRefresh,
      'authenticated': instance.authenticated,
      'controlAuthenticatedOnly': instance.controlAuthenticatedOnly,
      'roles': instance.roles,
      'headers': instance.headers,
      'enabledForm': instance.enabledForm,
      'saveToLocalStorage': instance.saveToLocalStorage,
      'getOneKey': instance.getOneKey,
      'scripts': instance.scripts
    };

const _$DGApiMethodEnumMap = {
  DGApiMethod.get: 'get',
  DGApiMethod.post: 'post',
  DGApiMethod.put: 'put',
  DGApiMethod.delete: 'delete',
};

const _$DGApiActionEnumMap = {
  DGApiAction.getOne: 'getOne',
  DGApiAction.getAll: 'getAll',
  DGApiAction.getOneRecovery: 'getOneRecovery',
  DGApiAction.getAllRecovery: 'getAllRecovery',
  DGApiAction.recoverOne: 'recoverOne',
  DGApiAction.recoverAll: 'recoverAll',
  DGApiAction.destroyForever: 'destroyForever',
  DGApiAction.destroyAll: 'destroyAll',
  DGApiAction.destroyAllForever: 'destroyAllForever',
  DGApiAction.destroy: 'destroy',
  DGApiAction.store: 'store',
  DGApiAction.update: 'update',
  DGApiAction.login: 'login',
  DGApiAction.profile: 'profile',
  DGApiAction.register: 'register',
  DGApiAction.forgotPasswordSend: 'forgotPasswordSend',
  DGApiAction.forgotPasswordUpdate: 'forgotPasswordUpdate',
  DGApiAction.emailVerificationSend: 'emailVerificationSend',
  DGApiAction.emailVerificationUpdate: 'emailVerificationUpdate',
};

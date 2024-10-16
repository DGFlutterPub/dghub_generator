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
      headers: (json['headers'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DGApiToJson(DGApi instance) => <String, dynamic>{
      'url': instance.url,
      'method': _$DGApiMethodEnumMap[instance.method]!,
      'action': _$DGApiActionEnumMap[instance.action]!,
      'realTime': instance.realTime,
      'autoDispose': instance.autoDispose,
      'preRefresh': instance.preRefresh,
      'headers': instance.headers,
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
  DGApiAction.destroy: 'destroy',
  DGApiAction.store: 'store',
  DGApiAction.update: 'update',
};

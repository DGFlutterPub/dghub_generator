// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_script.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGScript _$DGScriptFromJson(Map<String, dynamic> json) => DGScript(
      import: json['import'] as String?,
      field: json['field'] as String?,
      init: json['init'] as String?,
      success: json['success'] as String?,
      error: json['error'] as String?,
      type: $enumDecode(_$DGScriptTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$DGScriptToJson(DGScript instance) => <String, dynamic>{
      'import': instance.import,
      'field': instance.field,
      'init': instance.init,
      'success': instance.success,
      'error': instance.error,
      'type': _$DGScriptTypeEnumMap[instance.type]!
    };

const _$DGScriptTypeEnumMap = {
  DGScriptType.node: 'node',
  DGScriptType.python: 'type',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGConfig _$DGConfigFromJson(Map<String, dynamic> json) => DGConfig(
      dart: json['dart'] as bool? ?? true,
      node: json['node'] as bool? ?? true,
      python: json['python'] as bool? ?? true,
      createdAt: json['createdAt'] as bool? ?? true,
      deletedAt: json['deletedAt'] as bool? ?? true,
      updatedAt: json['updatedAt'] as bool? ?? true,
      id: json['id'] as bool? ?? true,
      autoIncrement: json['autoIncrement'] as bool? ?? false,
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
    );

Map<String, dynamic> _$DGConfigToJson(DGConfig instance) => <String, dynamic>{
      'dart': instance.dart,
      'node': instance.node,
      'python': instance.python,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'autoIncrement': instance.autoIncrement,
      'enabledGenerator': instance.enabledGenerator,
    };

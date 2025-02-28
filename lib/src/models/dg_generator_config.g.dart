// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_generator_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGGeneratorConfig _$DGGeneratorConfigFromJson(Map<String, dynamic> json) =>
    DGGeneratorConfig(
      dart: json['dart'] as bool? ?? true,
      node: json['node'] as bool? ?? true,
      python: json['python'] as bool? ?? true,
      createdAt: json['createdAt'] as bool? ?? true,
      deletedAt: json['deletedAt'] as bool? ?? true,
      updatedAt: json['updatedAt'] as bool? ?? true,
      language: json['language'] as bool? ?? false,
      id: json['id'] as bool? ?? true,
      autoIncrement: json['autoIncrement'] as bool? ?? false,
      enabledGenerator: json['enabledGenerator'] as bool? ?? true,
      saveLocalDatabase: json['saveLocalDatabase'] as bool? ?? true,
      paginationSize: json['paginationSize'] as int? ?? 20,
      itemLimit: json['itemLimit'] as int? ?? 0,
    );

Map<String, dynamic> _$DGGeneratorConfigToJson(DGGeneratorConfig instance) =>
    <String, dynamic>{
      'dart': instance.dart,
      'node': instance.node,
      'python': instance.python,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'id': instance.id,
      'language': instance.language,
      'autoIncrement': instance.autoIncrement,
      'enabledGenerator': instance.enabledGenerator,
      'saveLocalDatabase': instance.saveLocalDatabase,
      'paginationSize': instance.paginationSize,
      'itemLimit': instance.itemLimit
    };

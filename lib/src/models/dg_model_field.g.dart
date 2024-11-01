// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_model_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGModelField _$DGModelFieldFromJson(Map<String, dynamic> json) => DGModelField(
      key: json['key'] as String,
      defaultValue: json['defaultValue'],
      validate: json['validate'] == null
          ? const DGValidate()
          : DGValidate.fromJson(json['validate'] as Map<String, dynamic>),
      forms:
          (json['forms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      ref: json['ref'],
      store: json['store'] as bool? ?? true,
      update: json['update'] as bool? ?? true,
    );

Map<String, dynamic> _$DGModelFieldToJson(DGModelField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'defaultValue': instance.defaultValue,
      'validate': instance.validate.toJson(),
      'forms': instance.forms,
      'ref': instance.ref,
      'store': instance.store,
      'update': instance.update,
    };

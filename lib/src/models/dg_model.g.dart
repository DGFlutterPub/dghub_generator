// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGModel _$DGModelFromJson(Map<String, dynamic> json) => DGModel(
      key: json['key'] as String,
      defaultValue: json['defaultValue'],
      validate: json['validate'] == null
          ? const DGValidate()
          : DGValidate.fromJson(json['validate'] as Map<String, dynamic>),
      forms:
          (json['forms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      ref: json['ref'],
    );

Map<String, dynamic> _$DGModelToJson(DGModel instance) => <String, dynamic>{
      'key': instance.key,
      'defaultValue': instance.defaultValue,
      'validate': instance.validate.toJson(),
      'forms': instance.forms,
      'ref': instance.ref,
    };

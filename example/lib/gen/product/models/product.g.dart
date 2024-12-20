// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      title: json['title'] as String? ?? 'test',
      price: (json['price'] as num?)?.toDouble(),
      photo: json['photo'] as String?,
      enabled: json['enabled'] as bool?,
      metaData: (json['metaData'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["data4", "data2"],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'deletedAt': instance.deletedAt,
      'title': instance.title,
      'price': instance.price,
      'photo': instance.photo,
      'enabled': instance.enabled,
      'metaData': instance.metaData,
    };

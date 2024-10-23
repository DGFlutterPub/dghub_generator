// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductQuery _$ProductQueryFromJson(Map<String, dynamic> json) => ProductQuery(
      page: (json['page'] as num?)?.toInt() ?? 1,
      search: json['search'] as String?,
      title: json['title'] as String?,
      price: json['price'] as String?,
      photo: json['photo'] as String?,
      enabled: json['enabled'] as String?,
      metaData: json['metaData'] as String?,
    );

Map<String, dynamic> _$ProductQueryToJson(ProductQuery instance) =>
    <String, dynamic>{
      'page': instance.page,
      'search': instance.search,
      'title': instance.title,
      'price': instance.price,
      'photo': instance.photo,
      'enabled': instance.enabled,
      'metaData': instance.metaData,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      currentPage: (json['currentPage'] as num).toInt(),
      totalPage: (json['totalPage'] as num).toInt(),
    );

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'currentPage': instance.currentPage,
      'totalPage': instance.totalPage,
    };

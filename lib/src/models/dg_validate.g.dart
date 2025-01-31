// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dg_validate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DGValidate _$DGValidateFromJson(Map<String, dynamic> json) => DGValidate(
      isEmail: json['isEmail'] as bool? ?? false,
      isFile: json['isFile'] as bool? ?? false,
      isRequired: json['isRequired'] as bool? ?? false,
      isRoles: json['isRoles'] as bool? ?? false,
      isDate: json['isDate'] as bool? ?? false,
      isIPv6: json['isIPv6'] as bool? ?? false,
      isIp: json['isIp'] as bool? ?? false,
      isLowerCase: json['isLowerCase'] as bool? ?? false,
      isUpperCase: json['isUpperCase'] as bool? ?? false,
      isPhone: json['isPhone'] as bool? ?? false,
      isTypeOf: json['isTypeOf'] as bool? ?? false,
      isUUID: json['isUUID'] as bool? ?? false,
      isUrl: json['isUrl'] as bool? ?? false,
      matches: json['matches'] as String?,
      max: (json['max'] as num?)?.toInt(),
      maxDate: json['maxDate'] as String?,
      maxLength: (json['maxLength'] as num?)?.toInt(),
      min: (json['min'] as num?)?.toInt(),
      minDate: json['minDate'] as String?,
      minLength: (json['minLength'] as num?)?.toInt(),
      isHidden: json['isHidden'] as bool? ?? false,
      isLocation: json['isLocation'] as bool? ?? false,
      isPassword: json['isPassword'] as bool? ?? false,
      isEncrypt: json['isEncrypt'] as bool? ?? false,
      isBoolean: json['isBoolean'] as bool? ?? false,
      isDouble: json['isDouble'] as bool? ?? false,
      isInt: json['isInt'] as bool? ?? false,
      fileExtensions: (json['fileExtensions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["png", "jpg", "jpeg", "gif", "webp"],
      fileSize: (json['fileSize'] as num?)?.toInt() ?? 1000000,
      isList: json['isList'] as bool? ?? false,
      isListString: json['isListString'] as bool? ?? false,
      isUnique: json['isUnique'] as bool? ?? false,
      isToken: json['isToken'] as bool? ?? false,
      isString: json['isString'] as bool? ?? false,
      isMap: json['isMap'] as bool? ?? false,
      isAuthenticatedId: json['isAuthenticatedId'] as bool? ?? false,
    );

Map<String, dynamic> _$DGValidateToJson(DGValidate instance) =>
    <String, dynamic>{
      'isUnique': instance.isUnique,
      'isRequired': instance.isRequired,
      'isEmail': instance.isEmail,
      'isFile': instance.isFile,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
      'min': instance.min,
      'max': instance.max,
      'isPhone': instance.isPhone,
      'isIp': instance.isIp,
      'isIPv6': instance.isIPv6,
      'isUrl': instance.isUrl,
      'isUUID': instance.isUUID,
      'isLowerCase': instance.isLowerCase,
      'isUpperCase': instance.isUpperCase,
      'isDate': instance.isDate,
      'minDate': instance.minDate,
      'maxDate': instance.maxDate,
      'matches': instance.matches,
      'isTypeOf': instance.isTypeOf,
      'isPassword': instance.isPassword,
      'isHidden': instance.isHidden,
      'isLocation': instance.isLocation,
      'isEncrypt': instance.isEncrypt,
      'isString': instance.isString,
      'isInt': instance.isInt,
      'isDouble': instance.isDouble,
      'isBoolean': instance.isBoolean,
      'isListString': instance.isListString,
      'isList': instance.isList,
      'isRoles': instance.isRoles,
      'isToken': instance.isToken,
      'fileExtensions': instance.fileExtensions,
      'fileSize': instance.fileSize,
      'isMap': instance.isMap,
      'isAuthenticatedId': instance.isAuthenticatedId
    };

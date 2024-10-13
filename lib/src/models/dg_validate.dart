// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DGValidate {
  final bool isRequired;
  final bool isEmail;
  final int? minLength;
  final int? maxLength;
  final int? min;
  final int? max;
  final bool isPhone;
  final bool isIp;
  final bool isIPv6;
  final bool isUrl;
  final bool isUUID;
  final bool isLowerCase;
  final bool isUpperCase;
  final bool isDate;
  final String? minDate;
  final String? maxDate;
  final List<dynamic>? oneOf;
  final dynamic listOf;
  final String? matches;
  final bool isTypeOf;
  final bool isPassword;
  final bool isHidden;
  final bool isLocation;
  final bool isEncrypt;

  const DGValidate({
    this.isEmail = false,
    this.isRequired = false,
    this.isDate = false,
    this.isIPv6 = false,
    this.isIp = false,
    this.isLowerCase = false,
    this.isUpperCase = false,
    this.isPhone = false,
    this.isTypeOf = false,
    this.isUUID = false,
    this.isUrl = false,
    this.listOf,
    this.oneOf,
    this.matches,
    this.max,
    this.maxDate,
    this.maxLength,
    this.min,
    this.minDate,
    this.minLength,
    this.isHidden = false,
    this.isLocation = false,
    this.isPassword = false,
    this.isEncrypt = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isRequired': isRequired,
      'isEmail': isEmail,
      'minLength': minLength,
      'maxLength': maxLength,
      'min': min,
      'max': max,
      'isPhone': isPhone,
      'isIp': isIp,
      'isIPv6': isIPv6,
      'isUrl': isUrl,
      'isUUID': isUUID,
      'isLowerCase': isLowerCase,
      'isUpperCase': isUpperCase,
      'isDate': isDate,
      'minDate': minDate,
      'maxDate': maxDate,
      'oneOf': oneOf,
      'listOf': listOf,
      'matches': matches,
      'isTypeOf': isTypeOf,
      'isPassword': isPassword,
      'isHidden': isHidden,
      'isLocation': isLocation,
      'isEncrypt': isEncrypt,
    };
  }

  factory DGValidate.fromMap(Map<String, dynamic> map) {
    return DGValidate(
      isRequired: map['isRequired'] as bool,
      isEmail: map['isEmail'] as bool,
      minLength: map['minLength'] != null ? map['minLength'] as int : null,
      maxLength: map['maxLength'] != null ? map['maxLength'] as int : null,
      min: map['min'] != null ? map['min'] as int : null,
      max: map['max'] != null ? map['max'] as int : null,
      isPhone: map['isPhone'] as bool,
      isIp: map['isIp'] as bool,
      isIPv6: map['isIPv6'] as bool,
      isUrl: map['isUrl'] as bool,
      isUUID: map['isUUID'] as bool,
      isLowerCase: map['isLowerCase'] as bool,
      isUpperCase: map['isUpperCase'] as bool,
      isDate: map['isDate'] as bool,
      minDate: map['minDate'] != null ? map['minDate'] as String : null,
      maxDate: map['maxDate'] != null ? map['maxDate'] as String : null,
      oneOf: map['oneOf'] != null ? List<dynamic>.from((map['oneOf'] as List<dynamic>)) : null,
      listOf: map['listOf'] as dynamic,
      matches: map['matches'] != null ? map['matches'] as String : null,
      isTypeOf: map['isTypeOf'] as bool,
      isPassword: map['isPassword'] as bool,
      isHidden: map['isHidden'] as bool,
      isLocation: map['isLocation'] as bool,
      isEncrypt: map['isEncrypt'] as bool,
    );
  }
}

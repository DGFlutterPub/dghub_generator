import 'package:json_annotation/json_annotation.dart';

part 'dg_validate.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGValidate {
  final bool isUnique;
  final bool isRequired;
  final bool isEmail;
  final bool isFile;
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
  final String? matches;
  final bool isTypeOf;
  final bool isPassword;
  final bool isHidden;
  final bool isLocation;
  final bool isEncrypt;
  final bool isString;
  final bool isInt;
  final bool isDouble;
  final bool isBoolean;
  final bool isListString;
  final bool isList;
  final bool isMap;
  final bool isRoles;
  final bool isToken;
  final bool isAuthenticatedId;
  final List<String> fileExtensions;
  final int fileSize;

  const DGValidate(
      {this.isEmail = false,
      this.isFile = false,
      this.isRequired = false,
      this.isRoles = false,
      this.isDate = false,
      this.isIPv6 = false,
      this.isIp = false,
      this.isLowerCase = false,
      this.isUpperCase = false,
      this.isPhone = false,
      this.isTypeOf = false,
      this.isUUID = false,
      this.isUrl = false,
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
      this.isBoolean = false,
      this.isDouble = false,
      this.isInt = false,
      this.fileExtensions = const ["png", "jpg", "jpeg", "gif", "webp"],
      this.fileSize = 1000000,
      this.isList = false,
      this.isListString = false,
      this.isUnique = false,
      this.isToken = false,
      this.isMap = false,
      this.isAuthenticatedId = false,
      this.isString = false});
  factory DGValidate.fromJson(Map<String, dynamic> json) =>
      _$DGValidateFromJson(json);
  Map<String, dynamic> toJson() => _$DGValidateToJson(this);
}

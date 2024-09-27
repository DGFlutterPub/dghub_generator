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
  final bool isBoolean;
  final bool isNumber;
  final bool isString;
  final bool isDouble;
  final bool isInt;
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
    this.isBoolean = false,
    this.isDate = false,
    this.isDouble = false,
    this.isInt = false,
    this.isIPv6 = false,
    this.isIp = false,
    this.isLowerCase = false,
    this.isUpperCase = false,
    this.isNumber = false,
    this.isPhone = false,
    this.isString = false,
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
}

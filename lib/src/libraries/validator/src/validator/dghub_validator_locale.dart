abstract class DGLocale {
  String get name;
  String get unknownFieldMessage;
  String required([String? label]);
  String minLength(String v, int n, [String? label]);
  String min(String v, num n, [String? label]);
  String max(String v, num n, [String? label]);
  String positive(String v, [String? label]);
  String negative(String v, [String? label]);
  String maxLength(String v, int n, [String? label]);
  String email(String v, [String? label]);
  String phoneNumber(String v, [String? label]);
  String ip(String v, [String? label]);
  String ipv6(String v, [String? label]);
  String url(String v, [String? label]);
  String boolean(String v, [String? label]);
  String number(String v, [String? label]);
  String isInt(String v, [String? label]);
  String isDouble(String v, [String? label]);
  String notNumber(String v, [String? label]);
  String uuid(String v, [String? label]);
  String lowerCase(String v, [String? label]);
  String upperCase(String v, [String? label]);
  String date(String v, [String? label]);
  String dateMin(String v, DateTime min, [String? label]);
  String dateMax(String v, DateTime min, [String? label]);
  String oneOf(List<dynamic> items, String v, [String? label]);
  String notOneOf(List<dynamic> items, String v, [String? label]);
  String listOf(dynamic v, [String? label]);
  String matches(String regex, String v, [String? label]);
  String isTypeOf(dynamic v, [String? label]);
}

import '../../dghub_validator.dart';
import 'types/validators.dart';
import 'dghub_locale.dart';

import '../common/schema_value.dart';
import 'dghub_validator_locale.dart';

class ValidateResult {
  final bool isError;
  final String error;
  ValidateResult({required this.error, required this.isError});
}

typedef ValidationCallback<T> = dynamic Function(
  T? value, [
  Map<dynamic, dynamic>? ref,
]);

class DGValidator<T> extends SchemaValue {
  static ValidateResult validator(vali, data) {
    final DGSchema schema = DGSchema.shape(vali);
    var result = schema.catchErrors(data);
    if (result.values.isEmpty) {
      return ValidateResult(error: '', isError: false);
    } else {
      return ValidateResult(error: result.values.first, isError: true);
    }
  }

  DGValidator({
    this.optional = false,
    this.defaultValue,
    this.label,
  });

  /// optional by default is `False`
  /// if optional `True` the required validation will be ignored
  final bool optional;

  /// default is used when casting produces a `null` output value
  final T? defaultValue;

  /// Overrides the key name which is used in error messages.
  final String? label;

  /// transformation function
  /// this function will be called before any validation
  /// it can be used to transform the value before validation
  /// for example: `trim` a string
  /// or `parse` a string to a `DateTime`
  /// or `cast` a `String` to `int` ....
  T Function(T)? transformationFunction;

  final List<ValidationCallback<T>> validations = [];
  static DGLocale globalLocale = const DefaultLocale();

  DGValidator<T> addValidation(ValidationCallback<T> validator) {
    validations.add(validator);
    return this;
  }

  /// set custom locale
  static void setLocale(DGLocale locale) {
    globalLocale = locale;
  }

  /// Global validators
  dynamic validate(T? value, [Map<dynamic, dynamic>? entireData]) =>
      _test(value, entireData);

  dynamic _test(T? value, [Map<dynamic, dynamic>? ref]) {
    try {
      if (transformationFunction != null && value != null) {
        value = transformationFunction!(value);
      }

      if (value == null && defaultValue != null) {
        value = defaultValue;
      }

      for (var validate in validations) {
        if (optional && value.isNullOrEmpty) {
          return null;
        }

        final result = validate(value, ref);
        if (result != null) {
          return result;
        }
      }
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  ValidationCallback<T> build() => _test;
}

import '../dghub_validator_builder.dart';

extension NumValidatorExtensions<T> on DGValidator<T> {
  /// Checks if the value is a minimum of [min]
  /// [message] is the message to return if the validation fails
  DGValidator<T> min(num min, [String? message]) {
    return addValidation((v, [_]) {
      if (v is num) {
        return v < min
            ? message ?? DGValidator.globalLocale.min('$v', min, label)
            : null;
      }

      if (v is String) {
        return num.tryParse(v) != null && num.parse(v) < min
            ? message ?? DGValidator.globalLocale.min('$v', min, label)
            : null;
      }

      return 'Invalid type for min comparison';
    });
  }

  /// Checks if the value is a maximum of [max]
  /// [message] is the message to return if the validation fails
  DGValidator<T> max(num max, [String? message]) => addValidation((v, [_]) {
        if (v is num) {
          return v > max
              ? message ?? DGValidator.globalLocale.max('$v', max, label)
              : null;
        }

        if (v is String) {
          return num.tryParse(v) != null && num.parse(v) > max
              ? message ?? DGValidator.globalLocale.max('$v', max, label)
              : null;
        }

        return 'Invalid type for min comparison';
      });

  /// Checks if the value is between [min] and [max]
  /// [message] is the message to return if the validation fails
  DGValidator<T> positive([String? message]) => addValidation((v, [_]) {
        if (v is num) {
          return v < 0
              ? message ?? DGValidator.globalLocale.positive('$v', label)
              : null;
        }

        if (v is String) {
          return num.tryParse(v) != null && num.parse(v) < 0
              ? message ?? DGValidator.globalLocale.positive('$v', label)
              : null;
        }

        return 'Invalid type for min comparison';
      });

  /// Checks if the value is negative
  /// [message] is the message to return if the validation fails
  DGValidator<T> negative([String? message]) => addValidation((v, [_]) {
        if (v is num) {
          return v > 0
              ? message ?? DGValidator.globalLocale.negative('$v', label)
              : null;
        }

        if (v is String) {
          return num.tryParse(v) != null && num.parse(v) > 0
              ? message ?? DGValidator.globalLocale.negative('$v', label)
              : null;
        }
        return 'Invalid type for min comparison';
      });

  /// Checks if the value is a number
  /// [message] is the message to return if the validation fails
  DGValidator<T> number([String? message]) => addValidation((v, [_]) {
        if (v is num) {
          return null;
        }
        return num.tryParse(v.toString()) != null
            ? null
            : message ?? DGValidator.globalLocale.number('$v', label);
      });

  /// Checks if the value is an integer
  /// [message] is the message to return if the validation fails
  DGValidator<T> isInt([String? message]) => addValidation((v, [_]) {
        if (v is int) {
          return null;
        }

        return int.tryParse(v.toString()) != null
            ? null
            : message ?? DGValidator.globalLocale.isInt('$v', label);
      });

  /// Checks if the value is a double
  /// [message] is the message to return if the validation fails
  DGValidator<T> isDouble([String? message]) => addValidation((v, [_]) {
        if (v is double) {
          return null;
        }

        if (v is int) {
          return message ?? DGValidator.globalLocale.isDouble('$v', label);
        }

        if (int.tryParse(v.toString()) != null) {
          return message ?? DGValidator.globalLocale.isDouble('$v', label);
        }

        return double.tryParse(v.toString()) != null
            ? null
            : message ?? DGValidator.globalLocale.isDouble('$v', label);
      });

  /// Checks if the value is not a number
  /// [message] is the message to return if the validation fails
  DGValidator<T> notNumber([String? message]) => addValidation((v, [_]) {
        if (v is num) {
          return message ?? DGValidator.globalLocale.notNumber('$v', label);
        }
        return num.tryParse(v.toString()) == null
            ? null
            : message ?? DGValidator.globalLocale.notNumber('$v', label);
      });
}

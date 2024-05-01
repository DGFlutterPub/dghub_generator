import '../dghub_validator_builder.dart';

extension DateValidatorExtensions<T> on DGValidator<T> {
  /// Checks if the value is a date
  DGValidator<T> date([String? message]) => addValidation((v, [_]) {
        if (v is DateTime) {
          return null;
        }
        if (DateTime.tryParse(v.toString()) != null) {
          return null;
        }
        return message ?? DGValidator.globalLocale.date('$v', label);
      });

  /// Checks if the value is is after [date]
  /// [message] is the message to return if the validation fails
  DGValidator<T> minDate(DateTime date, [String? message]) =>
      addValidation((v, [_]) {
        if (DateTime.tryParse(v.toString()) == null) {
          return message ?? DGValidator.globalLocale.date('$v', label);
        }
        if (v is! DateTime) {
          return message ?? DGValidator.globalLocale.date('$v', label);
        }
        return v.isAfter(date) || v.isAtSameMomentAs(date)
            ? null
            : message ?? DGValidator.globalLocale.dateMin('$v', date, label);
      });

  /// Checks if the value is is before [date]
  /// [message] is the message to return if the validation fails
  DGValidator<T> maxDate(DateTime date, [String? message]) =>
      addValidation((v, [_]) {
        if (DateTime.tryParse(v.toString()) == null) {
          return message ?? DGValidator.globalLocale.date('$v', label);
        }
        if (v is! DateTime) {
          return message ?? DGValidator.globalLocale.date('$v', label);
        }
        return v.isBefore(date) || v.isAtSameMomentAs(date)
            ? null
            : message ?? DGValidator.globalLocale.dateMin('$v', date, label);
      });
}

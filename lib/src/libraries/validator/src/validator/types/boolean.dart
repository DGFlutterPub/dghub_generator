import '../dghub_validator_builder.dart';

extension BooleanValidatorExtensions<T> on DGValidator<T> {
  /// Checks if the value is a boolean
  DGValidator<T> boolean([String? message]) => addValidation((v, [_]) {
        return v is bool
            ? null
            : message ?? DGValidator.globalLocale.boolean('$v', label);
      });
}

import 'package:dghub_generator/dghub_generator.dart';
import '../models/auth_token_model.dart';

class AuthTokenValidator {
  ValidateResult checkModel(AuthTokenModel data) => DGValidator.validator(
        {"bearer": DGValidator<String>()},
        data.toJson(),
      );
}

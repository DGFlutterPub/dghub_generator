import 'package:dghub_generator/dghub_generator.dart';
import '../models/auth_model.dart';

class AuthValidator {
  ValidateResult checkModel(AuthModel data) => DGValidator.validator(
        {
          "email": DGValidator<String>().email("Invalid email address."),
          "token": DGValidator<String>()
        },
        data.toJson(),
      );
}

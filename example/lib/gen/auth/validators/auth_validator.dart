import 'package:dghub_generator/dghub_generator.dart';
import '../models/auth_model.dart';

class AuthValidator {
  ValidateResult checkModel(AuthModel data) => DGValidator.validator(
        {
          "name": DGValidator<String>().email("Invalid email address."),
          "phone": DGValidator<String>().phone("Invalid phone.")
        },
        data.toJson(),
      );
}

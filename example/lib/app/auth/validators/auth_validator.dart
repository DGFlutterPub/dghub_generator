import 'package:dghub_generator/dghub_generator.dart';
import 'package:example/app/auth/models/auth_model.dart';

//generated
class AuthValidator {
  static authModel(AuthModel data) => DGValidator.validator({
        "name": DGValidator<String>()
            .transform((value) => value.trim())
            .minLength(3, "Name must be at least 3 characters long."),
      }, data.toJson());
}

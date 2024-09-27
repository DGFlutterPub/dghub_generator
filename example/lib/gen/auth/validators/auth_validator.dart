import 'package:dghub_generator/dghub_generator.dart';
import 'package:example/gen/auth/models/auth_model.dart';

//generated
class AuthValidator {
  ValidateResult checkModel(AuthModel data) => DGValidator.validator({
        "email": DGValidator<String>()
            //isBoolean check with in dghub_generator package
            .boolean()
            //isEmail
            .email("Invalid email address."),
      }, data.toJson());
}

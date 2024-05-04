import 'package:dghub_generator/dghub_generator.dart';
import 'package:example/gen/auth/models/auth_model.dart';

//generated
class AuthValidator {
  ValidateResult checkModel(AuthModel data) => DGValidator.validator({
        "name": DGValidator<String>()
            //data.isBoolean
            .boolean()
            //data.isEmail
            .email("Invalid email address."),
      }, data.toJson());
}

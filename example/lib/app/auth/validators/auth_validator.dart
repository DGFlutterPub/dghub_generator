import 'package:dghub_generator/dghub_generator.dart';
import 'package:example/app/auth/models/auth_model.dart';

//generated
class AuthValidator {
  static authModel(AuthModel data) => DGValidator.validator({
        "name": DGValidator<String>()
            //data.isBoolean
            .boolean()
            //data.isEmail
            .email("Invalid email address."),
      }, data.toJson());
}

import 'package:dghub_generator/dghub_generator.dart';
import '../models/auth.dart';

class AuthValidator {
  ValidateResult checkModel(Auth data) => DGValidator.validator(
        {
          /*form*/
        },
        data.toJson(),
      );
}
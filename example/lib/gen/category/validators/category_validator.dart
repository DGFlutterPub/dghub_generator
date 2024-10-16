import 'package:dghub_generator/dghub_generator.dart';
import '../models/category.dart';

class CategoryValidator {
  ValidateResult checkModel(Category data) => DGValidator.validator(
        {
          /*form*/
        },
        data.toJson(),
      );
}
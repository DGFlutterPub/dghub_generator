import 'package:dghub_generator/dghub_generator.dart';
import '../models/product.dart';

class ProductValidator {
  ValidateResult checkModel(Product data) => DGValidator.validator(
        {
          /*form*/
        },
        data.toJson(),
      );
}

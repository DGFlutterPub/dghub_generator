import 'package:dghub_generator/dghub_generator.dart';
import '../../../../gen/product/models/product_model.dart';

class ProductValidator {
  ValidateResult checkModel(ProductModel data) => DGValidator.validator(
        {"title": DGValidator<String>()},
        data.toJson(),
      );
}

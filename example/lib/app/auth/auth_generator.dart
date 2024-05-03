import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  models: [
    DGModel(
        form: true,
        validate: DGValidate(isEmail: true),
        key: 'name',
        defaultValue: 'mg mg'),
  ],
)
class AuthGenerator {}

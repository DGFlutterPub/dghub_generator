import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  models: [
    DGModel(type: String, key: 'bearer'),
  ],
)
class AuthTokenGenerator {}

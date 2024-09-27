import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  models: [
    DGModel(
      key: 'bearer',
    ),
  ],
)
class AuthTokenGenerator {}

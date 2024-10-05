import 'package:dghub_generator/dghub_generator.dart';

import '../auth_token/models/auth_token_model.dart';

@DGHubGenerator(
  config: DGConfig(createdAt: true, deletedAt: true, updatedAt: true),
  models: [
    DGModel(
      form: true,
      type: String,
      validate: DGValidate(isEmail: true),
      key: 'email',
      defaultValue: 'example@gmail.com',
    ),
    DGModel(key: 'token', type: AuthTokenModel)
  ],
)
class AuthGenerator {}

import 'package:dghub_generator/dghub_generator.dart';

import 'models/auth_token_model.dart';

@DGHubGenerator(
  config: DGConfig(createdAt: true, deletedAt: true, updatedAt: true),
  models: [
    DGModel(
      form: true,
      validate: DGValidate(isEmail: true),
      key: 'email',
      defaultValue: 'example@gmail.com',
    ),
    DGModel(key: 'token', populate: AuthTokenModel)
  ],
)
class AuthGenerator {}

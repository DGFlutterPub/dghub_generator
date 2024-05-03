import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  config: DGConfig(createdAt: true, deletedAt: true, updatedAt: true),
  models: [
    DGModel(
      form: true,
      validate: DGValidate(isEmail: true),
      key: 'name',
      defaultValue: 'mg mg',
    ),
    DGModel(
      form: true,
      validate: DGValidate(isEmail: true),
      key: 'phone_no',
      defaultValue: '0975232323',
    ),
  ],
  provider: DGProvider(),
)
class AuthGenerator {}

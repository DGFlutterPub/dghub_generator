import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  config: DGConfig(createdAt: true, deletedAt: true, updatedAt: true),
  models: [
    DGModel(
      form: true,
      validate: DGValidate(isEmail: true, isBoolean: true),
      key: 'name',
      defaultValue: 'mg mg',
    ),
    DGModel(
      form: true,
      validate: DGValidate(isPhone: true),
      key: 'phone',
      defaultValue: '0975232323',
    ),
  ],
)
class AuthGenerator {}

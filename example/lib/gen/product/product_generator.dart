import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(
  config: DGConfig(createdAt: true, deletedAt: true, updatedAt: true),
  models: [
    DGModel(
      form: true,
      type: String,
      validate: DGValidate(maxLength: 200),
      key: 'title',
    ),
  ],
)
class ProductGenerator {}

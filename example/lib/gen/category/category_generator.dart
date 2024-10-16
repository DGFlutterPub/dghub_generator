import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(
    models: [DGModel(key: 'label', validate: DGValidate(isString: true))])
class CategoryGenerator {}

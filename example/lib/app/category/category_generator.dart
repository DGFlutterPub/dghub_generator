import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(
    config: DGConfig(node: true),
    models: [
      DGModel(key: 'name', validator: DGValidator()),
      DGModel(
        key: 'age',
      )
    ],
    controller: DGController(),
    pages: [DGPage(name: 'home')])
class CategoryGenerator {}

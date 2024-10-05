import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(apiServices: [
  DGApiService(
      route: '/product', method: DGMethod.get, action: DGAction.getOne),
  DGApiService(
      route: '/products', method: DGMethod.get, action: DGAction.getAll)
], models: [
  DGModel(key: 'title', type: String)
])
class ProductGenerator {}

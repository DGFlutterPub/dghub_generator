import "dart:io";

import "package:dghub_generator/dghub_generator.dart";

import "../category/models/category.dart";

@DGHubGenerator(config: DGConfig(node: true), apis: [
  DGApi(method: DGApiMethod.delete, action: DGApiAction.destroyForever),
  DGApi(method: DGApiMethod.delete, action: DGApiAction.destroy),
  DGApi(method: DGApiMethod.post, action: DGApiAction.update),
  DGApi(method: DGApiMethod.post, action: DGApiAction.store),
  DGApi(method: DGApiMethod.get, action: DGApiAction.getOne),
  DGApi(method: DGApiMethod.get, action: DGApiAction.getAll)
], models: [
  DGModel(validate: DGValidate(isString: true), key: 'title'),
  DGModel(
    validate: DGValidate(isDouble: true),
    key: 'price',
  ),
  DGModel(
    validate: DGValidate(isBoolean: true),
    key: 'enabled',
  ),
  DGModel(key: 'category', ref: Category),
  DGModel(validate: DGValidate(isFile), key: 'photo', ref: File)
])
class ProductGenerator {}

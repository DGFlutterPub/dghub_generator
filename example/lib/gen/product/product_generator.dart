import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(apis: [
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.store,
      authenticated: true,
      roles: ['admin']),
  DGApi(method: DGApiMethod.get, action: DGApiAction.getOne),
  DGApi(
      authenticated: true,
      roles: ['admin'],
      method: DGApiMethod.get,
      action: DGApiAction.getAll),
  DGApi(method: DGApiMethod.post, action: DGApiAction.update),
  DGApi(method: DGApiMethod.delete, action: DGApiAction.destroy),
  DGApi(method: DGApiMethod.delete, action: DGApiAction.destroyAll),
  DGApi(method: DGApiMethod.delete, action: DGApiAction.destroyForever),
  // DGApi(method: DGApiMethod.get, action: DGApiAction.getAllRecovery),
  //DGApi(method: DGApiMethod.get, action: DGApiAction.getOneRecovery),
  // DGApi(method: DGApiMethod.get, action: DGApiAction.recoverOne),
//  DGApi(method: DGApiMethod.get, action: DGApiAction.recoverAll),
], models: [
  DGModel(validate: DGValidate(isString: true), key: 'title'),
  DGModel(validate: DGValidate(isDouble: true), key: 'price'),
  DGModel(validate: DGValidate(isFile: true), key: 'photo'),
  DGModel(validate: DGValidate(isBoolean: true), key: "enabled")
])
class ProductGenerator {}

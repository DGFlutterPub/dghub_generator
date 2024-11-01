import "package:dghub_generator/dghub_generator.dart";

@DGHubGenerator(apis: [
  DGApi(
      realTime: true,
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
], model: [
  DGModelField(
      validate: DGValidate(isString: true), defaultValue: 'test', key: 'title'),
  DGModelField(validate: DGValidate(isDouble: true), key: 'price'),
  DGModelField(validate: DGValidate(isFile: true), key: 'photo'),
  DGModelField(validate: DGValidate(isBoolean: true), key: "enabled"),
  DGModelField(
      validate: DGValidate(isListString: true),
      defaultValue: ['data4', 'data2'],
      key: "metaData"),
])
class ProductGenerator {}

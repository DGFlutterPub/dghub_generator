import "package:dghub_generator/dghub_generator.dart";

//DO NOT DELETE THIS FILE
//DO NOT REMOVE 'email,password,roles,token'

@DGHubGenerator(apis: [
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.register,
      enabledForm: false),
  DGApi(
      method: DGApiMethod.post, action: DGApiAction.login, enabledForm: false),
], models: [
  DGModel(validate: DGValidate(isEmail: true), key: 'email'),
  DGModel(validate: DGValidate(isPassword: true), key: 'password'),
  DGModel(store: false, validate: DGValidate(isListString: true), key: 'roles'),
  DGModel(store: false, validate: DGValidate(isToken: true), key: 'token')
])
class AuthGenerator {}

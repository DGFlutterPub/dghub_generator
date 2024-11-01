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
], model: [
  DGModelField(validate: DGValidate(isEmail: true), key: 'email'),
  DGModelField(validate: DGValidate(isPassword: true), key: 'password'),
  DGModelField(
      store: false, validate: DGValidate(isListString: true), key: 'roles'),
  DGModelField(store: false, validate: DGValidate(isToken: true), key: 'token')
])
class AuthGenerator {}

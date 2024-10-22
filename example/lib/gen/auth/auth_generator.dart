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
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.forgotPasswordSend,
      enabledForm: false),
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.forgotPasswordUpdate,
      enabledForm: false),
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.emailVerificationSend,
      authenticated: true,
      enabledForm: false),
  DGApi(
      method: DGApiMethod.post,
      action: DGApiAction.emailVerificationUpdate,
      authenticated: true,
      enabledForm: false),
], models: [
  DGModel(
      forms: ['login', 'register', 'forgotPassword', 'emailVerification'],
      validate: DGValidate(isEmail: true),
      key: 'email'),
  DGModel(
      forms: ['login', 'register'],
      validate: DGValidate(isPassword: true),
      key: 'password'),
  DGModel(store: false, validate: DGValidate(isRoles: true), key: 'roles'),
  DGModel(store: false, validate: DGValidate(isToken: true), key: 'token')
])
class AuthGenerator {}

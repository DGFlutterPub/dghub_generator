import "models/auth.dart";

//DO NOT DELETE THIS FILE

@DGHubGenerator(
apis: [
 DGApi(
      path: '/register',
      method: DGApiMethod.post,
      action: DGApiAction.store,
      enabledAutoForm = false
    ),
DGApi(
      path: '/login',
      method: DGApiMethod.post,
      action: DGApiAction.store,
      enabledAutoForm = false
    ),], 
models: [
  DGModel(validate: DGValidate(isEmail: true), key: 'email'),
  DGModel(validate: DGValidate(isPassword: true), key: 'password'),
  DGModel(validate: DGValidate(isList: true, key: 'roles')
])
class AuthGenerator {}
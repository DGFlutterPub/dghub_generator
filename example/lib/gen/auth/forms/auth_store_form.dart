import 'package:dio/dio.dart';
/*import*/

class AuthStoreForm {
  AuthStoreForm({
    this.email,
    this.password,
    this.roles,
  });

  String? email;
  dynamic? password;
  dynamic? roles;

  Future<FormData> toFormData() async => FormData.fromMap({
        "email": email,
        "password": password,
        "roles": roles,
      });
}

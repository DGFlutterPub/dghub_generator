import 'package:dio/dio.dart';
/*import*/

class AuthEmailVerificationSendForm {
  AuthEmailVerificationSendForm({
    this.email,
    this.password,
    this.roles,
    this.token,
  });

  String? email;
  String? password;
  List<String>? roles;
  String? token;

  Future<FormData> toFormData() async => FormData.fromMap({
        "email": email,
        "password": password,
        "roles": roles,
        "token": token,
      });
}

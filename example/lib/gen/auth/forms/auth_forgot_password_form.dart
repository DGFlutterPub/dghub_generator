import 'package:dio/dio.dart';
/*import*/

class AuthForgotPasswordForm {
  AuthForgotPasswordForm({
    this.email,
  });

  String? email;

  Future<FormData> toFormData() async => FormData.fromMap({
        "email": email,
      });
}

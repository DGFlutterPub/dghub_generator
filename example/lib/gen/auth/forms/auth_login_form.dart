import 'package:dio/dio.dart';
/*import*/

class AuthLoginForm{
  AuthLoginForm({
  this.email,
this.password,

  });

   String? email;
String? password;


  Future<FormData> toFormData() async => FormData.fromMap({
    "email":  email,
"password":  password,

  });
}

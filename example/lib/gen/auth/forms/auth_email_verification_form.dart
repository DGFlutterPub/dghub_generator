import 'package:dio/dio.dart';
/*import*/

class AuthEmailVerificationForm{
  AuthEmailVerificationForm({
  this.email,

  });

   String? email;


  Future<FormData> toFormData() async => FormData.fromMap({
    "email":  email,

  });
}

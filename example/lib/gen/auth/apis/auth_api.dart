import '../../../system/services/api_services.dart';
import '../models/auth.dart';
import 'package:dio/dio.dart';


class AuthApi {
   Future<Auth> authRegister({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_register' ,data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

  Future<Auth> authLogin({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_login' ,data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }


}
import '../../../system/services/api_services.dart';
import '../models/auth.dart';
import 'package:dio/dio.dart';

class AuthApi {
  Future<Auth> register({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/register', data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

  Future<Auth> login({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/login', data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }
}

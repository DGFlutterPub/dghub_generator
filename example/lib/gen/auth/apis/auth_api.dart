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

  Future<bool> authForgotPasswordSend({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_forgot_password_send' ,data: form);
      return response.data;
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Auth> authForgotPasswordUpdate({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_forgot_password_update/$id' ,data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }

  Future<bool> authEmailVerificationSend({required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_email_verification_send' ,data: form);
      return response.data;
    } catch (e, s) {
      throw e.toString();
    }
  }

Future<Auth> authEmailVerificationUpdate({required String id, required FormData form}) async {
    try {
      var response = await ApiService.request().post('/auth_email_verification_update/$id' ,data: form);
      return Auth.fromJson(response.data);
    } catch (e, s) {
      throw e.toString();
    }
  }


}
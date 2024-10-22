import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authRegisterProvider = StateNotifierProvider<
    AuthRegisterNotifier,
    AsyncValue<Auth>?>((ref) => AuthRegisterNotifier());

class AuthRegisterNotifier extends StateNotifier<AsyncValue<Auth>?> {
   AuthRegisterNotifier() : super(null);
  
  final _api = AuthApi();

  authRegister({required FormData form}) {
    state = const AsyncLoading();
    _api.authRegister(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
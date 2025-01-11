import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';
import '../sockets/auth_socket.dart';

var authLoginProvider = StateNotifierProvider<
    AuthLoginNotifier,
    AsyncValue<Auth>?>((ref) => AuthLoginNotifier());

class AuthLoginNotifier extends StateNotifier<AsyncValue<Auth>?> {
   AuthLoginNotifier() : super(null);
  
  final _api = AuthApi();
  final _socket = AuthSocket();

  authLogin({required FormData form}) {
    state = const AsyncLoading();
    _api.authLogin(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }

  authLoginRealTimeListening() {
    _socket.login(result: (data) {
      state = AsyncData(data);
    });
  }

}
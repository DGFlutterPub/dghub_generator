import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authForgotPasswordSendProvider =
    StateNotifierProvider<AuthForgotPasswordSendNotifier, AsyncValue<bool>?>(
        (ref) => AuthForgotPasswordSendNotifier());

class AuthForgotPasswordSendNotifier extends StateNotifier<AsyncValue<bool>?> {
  AuthForgotPasswordSendNotifier() : super(null);

  final _api = AuthApi();

  authForgotPasswordSend({required FormData form}) {
    state = const AsyncLoading();
    _api.authForgotPasswordSend(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}

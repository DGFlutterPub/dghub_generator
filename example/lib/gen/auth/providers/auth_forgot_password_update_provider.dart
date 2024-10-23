import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authForgotPasswordUpdateProvider =
    StateNotifierProvider<AuthForgotPasswordUpdateNotifier, AsyncValue<Auth>?>(
        (ref) => AuthForgotPasswordUpdateNotifier());

class AuthForgotPasswordUpdateNotifier
    extends StateNotifier<AsyncValue<Auth>?> {
  AuthForgotPasswordUpdateNotifier() : super(null);

  final _api = AuthApi();

  authForgotPasswordUpdate({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.authForgotPasswordUpdate(form: form, id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}

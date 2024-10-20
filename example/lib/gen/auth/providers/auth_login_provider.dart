import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authLoginProvider = StateNotifierProvider<
    AuthLoginNotifier,
    AsyncValue<Auth>?>((ref) => AuthLoginNotifier());

class AuthLoginNotifier extends StateNotifier<AsyncValue<Auth>?> {
   AuthLoginNotifier() : super(null);
  
  final _api = AuthApi();

  login({required FormData form}) {
    state = const AsyncLoading();
    _api.login(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
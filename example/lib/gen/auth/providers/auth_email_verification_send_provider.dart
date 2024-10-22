import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authEmailVerificationSendProvider = StateNotifierProvider<
    AuthEmailVerificationSendNotifier,
    AsyncValue<Auth>?>((ref) => AuthEmailVerificationSendNotifier());

class AuthEmailVerificationSendNotifier extends StateNotifier<AsyncValue<Auth>?> {
   AuthEmailVerificationSendNotifier() : super(null);
  
  final _api = AuthApi();

  authEmailVerificationSend({required FormData form}) {
    state = const AsyncLoading();
    _api.authEmailVerificationSend(form: form).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}
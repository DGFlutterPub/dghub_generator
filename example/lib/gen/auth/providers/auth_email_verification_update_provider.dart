import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth.dart';
import '../apis/auth_api.dart';

var authEmailVerificationUpdateProvider = StateNotifierProvider<
    AuthEmailVerificationUpdateNotifier,
    AsyncValue<Auth>?>((ref) => AuthEmailVerificationUpdateNotifier());

class AuthEmailVerificationUpdateNotifier
    extends StateNotifier<AsyncValue<Auth>?> {
  AuthEmailVerificationUpdateNotifier() : super(null);

  final _api = AuthApi();

  authEmailVerificationUpdate({required String id, required FormData form}) {
    state = const AsyncLoading();
    _api.authEmailVerificationUpdate(form: form, id: id).then((response) {
      state = AsyncData(response);
    }).onError((e, s) {
      state = AsyncError(e!, s);
    });
  }
}

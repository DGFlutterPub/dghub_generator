import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:encrypt_shared_preferences/provider.dart';
import '../../config/global.dart';
import '../../gen/auth/models/auth.dart';

class ApiService {
  static Dio request({BaseOptions? option, LogInterceptor? logInterceptor}) {
    final EncryptedSharedPreferences box =
        EncryptedSharedPreferences.getInstance();
    String? token;
    try {
      token = Auth.fromJson(jsonDecode(box.getString('Auth')!)).token;
    } catch (e) {
      token = null;
    }

    CacheOptions? customCacheOptions = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.refreshForceCache,
      priority: CachePriority.high,
      maxStale: const Duration(minutes: 5),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
    );

    var customDio = Dio(option ??
        BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            contentType: "application/json",
            headers: {'Authorization': 'Bearer $token'},
            baseUrl: apiUrl))
      ..transformer = BackgroundTransformer()
      ..interceptors.add(DioCacheInterceptor(options: customCacheOptions))
      ..interceptors.add(logInterceptor ??
          LogInterceptor(
              requestBody: true,
              requestHeader: true,
              responseHeader: true,
              request: false,
              responseBody: true));

    return customDio;
  }
}

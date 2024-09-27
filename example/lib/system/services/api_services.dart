import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:example/config/global.dart';

class ApiService {
  static Dio request({BaseOptions? option, LogInterceptor? logInterceptor}) {
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
            // headers: {'Authorization': 'Bearer $token'},
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

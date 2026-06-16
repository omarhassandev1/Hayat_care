import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../storage/token_storage.dart';
import 'api_endpoints.dart';

/// A single Dio instance shared across all features.
/// The [AuthInterceptor] automatically attaches the JWT on every request
/// and clears credentials on a 401 response.
@module
abstract class DioModule {
  @lazySingleton
  Dio dio(TokenStorage tokenStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(_AuthInterceptor(tokenStorage));

    return dio;
  }
}

class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.readToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // If the token is expired/invalid the backend returns 401.
    // The cubit / splash screen already handle redirection to login,
    // so we just pass the error along here.
    handler.next(err);
  }
}

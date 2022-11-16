// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';

import 'package:dev_community/constants/constants.dart';
import 'package:dio/dio.dart';

BaseOptions _baseOptions = BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  validateStatus: (statusCode) {
    if (statusCode == null) {
      return false;
    }
    if (statusCode == 422) {
      return true;
    } else {
      return statusCode >= 200 && statusCode < 500;
    }
  },
);

InterceptorsWrapper _interceptorsWrapper = InterceptorsWrapper(
  onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    log('onRequest: ${options.method} ${options.path}, ${options.queryParameters}');

    return handler.next(options);
  },
  onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
    log('onResponse: ${response.statusCode} ${response.statusMessage}');

    return handler.next(response);
  },
  onError: (DioError error, ErrorInterceptorHandler handler) {
    log('onError: ${error.response?.statusCode} ${error.response?.data['error'].toString()}');

    return handler.next(error);
  },
);

/// Provides client for API, based on dio.
///
/// It uses [_baseOptions] and [_interceptorsWrapper] as base options.
class ClientApi {
  static Dio createDio({String baseUrl = ApiConstants.baseUrl}) {
    final options = _baseOptions.copyWith(baseUrl: baseUrl);

    final dio = Dio(options);

    return dio;
  }

  static Dio createDioWithInterceptors({
    String baseUrl = ApiConstants.baseUrl,
    InterceptorsWrapper? interceptorsWrapper,
  }) {
    log('creating dio with base url: $baseUrl');
    final interceptors = interceptorsWrapper ?? _interceptorsWrapper;

    final dio = ClientApi.createDio(baseUrl: baseUrl);

    return dio..interceptors.add(interceptors);
  }

  /// Simple getters for dio with manual configuration. For simple usage.
  static Dio get dio => createDio();

  static Dio get dioWithInterceptors => createDioWithInterceptors();
}

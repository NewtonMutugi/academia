import 'package:academia/configs/configs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import './auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  /// The DioClient
  ///
  /// Will be used to send requests to the server
  late Dio dio;

  /// Ensure that before instanciating a DioClient that
  /// you must have injected the flavor
  DioClient() {
    final GetIt getIt = GetIt.instance;

    dio = Dio(
      BaseOptions(
        baseUrl: getIt<FlavorConfig>().apiBaseUrl,
        preserveHeaderCase: true,
        receiveDataWhenStatusError: true,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        responseBody: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        maxWidth: 90,
        compact: true,
        enabled: kDebugMode,
      ),
    );

    _addAuthInterceptor();
  }

  void _addAuthInterceptor() {
    dio.interceptors.add(
      AuthInterceptor(
        dio: dio,
      ),
    );
  }

  void addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }
}

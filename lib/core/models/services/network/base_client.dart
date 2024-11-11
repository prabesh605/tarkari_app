import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tarkari_app/core/constants/api_constants.dart';
import 'package:tarkari_app/core/constants/storage_constants.dart';
import 'package:tarkari_app/core/models/services/storage/sharedpref_helper.dart';
import 'network_connection.dart';

class BaseClient {
  BaseClient._() {
    _setupAuthHeaderInterceptor();
  }

  static final BaseClient _instance = BaseClient._();
  static BaseClient get instance => _instance;

  void _setupAuthHeaderInterceptor() {
    //get token
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
          final bearerToken = SharedPrefHelper.read(StorageConstant.token);
          options.headers['Accept'] = "*/*";
          options.contentType = Headers.jsonContentType;
          if (bearerToken.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $bearerToken";
          }
          r.next(options);
        },
        onError: (e, handler) {
          handler.next(e);
        },
      ),
    );
  }

  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"content-type": "application/json", "accept": "*%*"},
      responseType: ResponseType.json));

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _dio.get(
          uri,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        print(e.toString());
        // throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      // throw const NetworkExceptions.noInternetConnection();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );

        return res.data;
      } on DioException catch (e) {
        // throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      // throw const NetworkExceptions.noInternetConnection();
    }
  }

  // /// return response body or throws [NetworkExceptions]
  // Future<dynamic> post(
  //   String uri, {
  //   dynamic data,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  //   CancelToken?
  //   cancelToken,
  // }) async {
  //   if (await NetworkConnectionCheck.checkConnection()) {
  //     try {
  //       final res = await _dio.post(
  //         uri,
  //         data: data,
  //         queryParameters: queryParameters,
  //         options: options,
  //         cancelToken: cancelToken,
  //       );

  //       return res.data;
  //     } on DioException catch (e) {
  //       throw e.toNetworkException();
  //     } catch (e) {
  //       rethrow;
  //     }
  //   } else {
  //     throw const NetworkExceptions.noInternetConnection();
  //   }
  // }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      // throw e.toNetworkException();
      // } on NetworkExceptions catch (_) {
      //   rethrow;
      // }
    }
  }
}

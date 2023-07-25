/// Author:    Lokendra Gharti
/// Created:   20.12.2022
/// Description:
/// (c) Copyright by lokendragharti3@gmail.com.
///*/
import 'package:cms/core/data/remote/token_error_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../modules/auth/presentation/provider/auth_notifier.dart';
import '../local/storage_const.dart';
import 'api_endpoints.dart';

class AuthInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final FlutterSecureStorage _localStorage;
  bool isNormalRequest = false;
  AuthNotifier authNotifier;

  AuthInterceptor(this._dio, this._localStorage, this.authNotifier);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["requiresToken"] == false) {
      // if the request doesn't need token, then just continue to the next interceptor
      options.headers.remove("requiresToken"); //remove the auxiliary header
      options.headers.remove("Authorization"); //remove the auxiliary header
      isNormalRequest = true;
      handler.next(options);
    } else {
      isNormalRequest = false;
      // get tokens from local storage, Shared-preference / Hive or flutter_secure_storage
      final accessToken =
          await _localStorage.read(key: LocalStorageConst.kAccessToken);
      final refreshToken =
          await _localStorage.read(key: LocalStorageConst.kRefreshToken);
      if (accessToken == null || refreshToken == null) {
        _performLogout(_dio);
        // create custom dio error
        options.extra["tokenErrorType"] = TokenErrorType
            .tokenNotFound; // I use enum type, you can change it to string
        final error = DioError(
            requestOptions: options,
            type: DioErrorType.response,
            response: Response(
                statusMessage: TokenErrorType.tokenNotFound.description,
                statusCode: 401,
                requestOptions: options));
        return handler.reject(error);
      } else {
        options.headers.addAll(
          <String, String>{'Authorization': 'Bearer $accessToken'},
        );
        handler.next(options);
      }
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (isNormalRequest == false) {
      if (err.response?.statusCode == 401) {
        if (_dio.options.headers['Retry-Count'] == 1) {
          return handler.next(err);
        }
        var requestOptions = err.requestOptions;
        var accessToken = await _refreshToken();
        if (accessToken == null) {
          //if still access token is null means
          return handler.next(err);
        } else {
          final opts = Options(method: requestOptions.method);
          _dio.options.headers["Authorization"] = "Bearer $accessToken";
          _dio.options.headers["Accept"] = "application/json";
          _dio.options.headers['Retry-Count'] =
              1; //setting retry count to 1 to prevent further concurrent calls
          final Response response = await _dio.request(requestOptions.path,
              options: opts,
              cancelToken: requestOptions.cancelToken,
              onReceiveProgress: requestOptions.onReceiveProgress,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters);
          // ignore: unnecessary_null_comparison
          if (response != null) {
            return handler.resolve(response);
          } else {
            return handler.next(err);
          }
        }
      } else {
        return handler.next(err);
      }
    } else {
      return handler.next(err);
    }
  }

  Future<String?> _refreshToken() async {
    try {
      var dioRefresh =
          Dio(); // should create new dioRefresh instance because the request interceptor is being locked
      if (kDebugMode) {
        dioRefresh.interceptors.add(PrettyDioLogger(
            responseBody: true,
            requestHeader: true,
            responseHeader: false,
            requestBody: true));
      }
      // get refresh token from local storage
      final refreshToken =
          await _localStorage.read(key: LocalStorageConst.kRefreshToken);
      // make request to server to get the new access token from server using refresh token
      final response = await dioRefresh.post(
        APIPathHelper.baseUrl + APIPathHelper.authAPIs(APIPath.refreshToken),
        data: {"refresh_token": "$refreshToken"},
        options: Options(
          headers: <String, dynamic>{
            'accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newAccessToken = response
            .data["access_token"]; // parse data based on your JSON structure
        final newRefreshToken = response
            .data["refresh_token"]; // parse data based on your JSON structure
        await _localStorage.write(
            key: LocalStorageConst.kAccessToken, value: newAccessToken);
        await _localStorage.write(
            key: LocalStorageConst.kRefreshToken,
            value: newRefreshToken); // save to local storage
        // save to local storage
        return _localStorage.read(key: LocalStorageConst.kAccessToken);
      } else if (response.statusCode == 401) {
        // it means your refresh token no longer valid now, it may be revoked by the backend
        _performLogout(_dio);
        return null;
      }
    } on DioError {
      _performLogout(_dio);
      return null;
    }
    return null;
  }

  void _performLogout(Dio dio) async {
    // CustomToast.showErrorToast(TokenErrorType.invalidAccessToken.description);
    authNotifier.logout();
    //TODO: Perform logout
    // await _localStorage.delete(key:LocalStorageConst.kAccessToken);
    // await   _localStorage.delete(key: LocalStorageConst.kRefreshToken); // remove token from local storage
  }
}

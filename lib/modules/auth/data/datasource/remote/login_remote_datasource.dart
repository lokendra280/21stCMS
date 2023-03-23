import 'package:dio/dio.dart';

import '../../../../../core/data/remote/api_endpoints.dart';
import '../../../../../core/data/remote/dio_client.dart';
import '../../model/req_params/login_params.dart';

abstract class LoginRemoteDataSource {
  Future<dynamic> loginUser(LoginParams params);

  Future<dynamic> getToken(
      {required String code, required String clientId, required String email});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  late DioClient dioClient;

  LoginRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<dynamic> loginUser(LoginParams params) async {
    try {
      final response = await dioClient.post(
          APIPathHelper.authAPIs(APIPath.login),
          options: Options(headers: {"requiresToken": false}),
          data: {
            "username": params.email?.trim(),
            "password": params.password?.trim(),
            "client_id": APIPathHelper.clientSecret,
            "client_secret": APIPathHelper.clientSecret
          });
      return getToken(
          code: response['code'],
          clientId: APIPathHelper.clientSecret,
          email: params.email!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> getToken(
      {required String code,
      required String clientId,
      required String email}) async {
    try {
      final response = await dioClient.post(
          APIPathHelper.authAPIs(APIPath.authToken),
          data: {"code": code, "clientId": clientId, "email": email});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

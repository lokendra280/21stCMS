
import '../../../core/data/remote/api_result.dart';
import '../data/model/req_params/login_params.dart';

abstract class LoginRepository{
  Future<ApiResult<String?>> loginUser(LoginParams loginParams);
  // Future<ApiResult<String?>> loginWithFacebook();
  // Future<ApiResult<String?>> loginWithApple();
  // Future<ApiResult<String?>> loginWithGoogle();
}
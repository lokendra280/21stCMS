
import '../../../core/data/remote/api_result.dart';
import '../data/model/req_params/registration_params.dart';

abstract class RegisterRepository {
  Future<ApiResult<String?>> registerUser(RegistrationParams registrationParams);
}

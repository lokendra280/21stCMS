
import '../../../core/data/remote/api_result.dart';

abstract class OtpRepository {
  Future<ApiResult<String?>> otpRegister({String? phone, String? email});
  Future<ApiResult<String?>> sendOtpResetPwd({String? phone, String? email});
}

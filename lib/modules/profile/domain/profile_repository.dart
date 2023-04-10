import 'package:image_picker/image_picker.dart';

import '../../../core/data/models/network_image.dart';
import '../../../core/data/remote/api_result.dart';
import '../../auth/data/model/req_params/login_params.dart';
import '../data/model/req_model/change_pwd_params.dart';
import '../data/model/req_model/profile_req_model.dart';
import '../data/model/response_model/profile_info.dart';

abstract class ProfileRepository {
  Future<ApiResult<ProfileInfo>> getUserProfile();

  // Future<ApiResult> updateProfile(ProfileUpdateReqParams reqParams);

  // Future<ApiResult<NetworkImageModel>> updateProfilePic(XFile pickedFile);

  // Future<ApiResult> changePassword(ChangePasswordParams reqParams);
  // Future<ApiResult<String?>> removeAccount();
  // LoginParams? getSavedCredential();
}

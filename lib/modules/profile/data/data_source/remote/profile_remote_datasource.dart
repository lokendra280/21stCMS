import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/models/image_upload_params.dart';
import '../../../../../core/data/remote/dio_client.dart';
import '../../../../../core/data/remote/api_endpoints.dart';
import '../../model/req_model/change_pwd_params.dart';
import '../../model/req_model/profile_req_model.dart';

abstract class ProfileRemoteDataSource {
  Future<dynamic> getProfileInfo();
  Future<dynamic> removeAccount();

  Future<dynamic> updateProfile(ProfileUpdateReqParams reqParams);

  Future<dynamic> updateProfilePic(XFile pickedFile);

  Future<dynamic> uploadImage(XFile pickedFile);

  Future<dynamic> changePassword(ChangePasswordParams reqParams);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  late DioClient dioClient;

  ProfileRemoteDataSourceImpl({required this.dioClient});

  @override
  Future getProfileInfo() async {
    try {
      //setting client info before request
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.profileInfo));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateProfile(ProfileUpdateReqParams params) async {
    try {
      final response = await dioClient.patch(
        APIPathHelper.authAPIs(APIPath.updateProfile),
        data: params.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateProfilePic(XFile pickedFile) async {
    try {
      final ImageUploadParams params = await uploadImage(pickedFile);
      final response = await dioClient.authPost(
        APIPathHelper.authAPIs(APIPath.profilePic),
        data: params.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future changePassword(ChangePasswordParams params) async {
    try {
      final response = await dioClient.patch(
        APIPathHelper.authAPIs(APIPath.changePassword),
        data: params.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future uploadImage(XFile pickedFile) async {
    try {
      final response = await dioClient.authMultiPartPost(
        APIPathHelper.categoryImageUrl(APIPath.profilePic.name),
        data: FormData.fromMap(
          {
            "file": await MultipartFile.fromFile(pickedFile.path,
                filename: pickedFile.path.toString()),
          },
        ),
      );
      return ImageUploadParams.fromJson(response[0]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future removeAccount() async {
    try {
      final response = await dioClient.delete(
        APIPathHelper.authAPIs(APIPath.removeAccount),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

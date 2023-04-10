import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/data/models/image_upload_params.dart';
import '../../../../../core/data/remote/dio_client.dart';
import '../../../../../core/data/remote/api_endpoints.dart';
import '../../model/req_model/change_pwd_params.dart';
import '../../model/req_model/profile_req_model.dart';

abstract class ProfileRemoteDataSource {
  Future<dynamic> getProfileInfo();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  late DioClient dioClient;

  ProfileRemoteDataSourceImpl({required this.dioClient});

  @override
  Future getProfileInfo() async {
    try {
      //setting client info before request
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.Task));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future uploadImage(XFile pickedFile) async {
  //   try {
  //     final response = await dioClient.authMultiPartPost(
  //       APIPathHelper.assetManager(APIPath.imageUpload),
  //       data: FormData.fromMap(
  //         {
  //           "file": await MultipartFile.fromFile(pickedFile.path,
  //               filename: pickedFile.path.toString()),
  //         },
  //       ),
  //     );
  //     return ImageUploadParams.fromJson(response[0]);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future uploadImage(XFile pickedFile) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}

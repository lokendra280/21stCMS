import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/models/network_image.dart';
import '../../../../core/data/remote/api_result.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/data/remote/network_info.dart';
import '../../domain/profile_repository.dart';
import '../data_source/remote/profile_remote_datasource.dart';
import '../model/req_model/change_pwd_params.dart';
import '../model/req_model/profile_req_model.dart';
import '../model/response_model/profile_info.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<ApiResult<ProfileInfo>> getUserProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getProfileInfo();
        return ApiResult.success(data: ProfileInfo.fromJson(remoteData));
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  e.response?.data['error']['message']));
        } else {
          print(e.toString());
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
          // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }
      }
    } else {
      //Or fetch data locally
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }

  // @override
  // Future<ApiResult> updateProfile(ProfileUpdateReqParams reqParams) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteData = await remoteDataSource.updateProfile(reqParams);
  //       return ApiResult.success(data: remoteData);
  //     } catch (e) {
  //       if (e is DioError && e.type == DioErrorType.response) {
  //         return ApiResult.failure(
  //             error: NetworkExceptions.defaultError(
  //                 e.response?.data['error']['message']));
  //       } else {
  //         print(e.toString());
  //         return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //         // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //       }
  //     }
  //   } else {
  //     //Or fetch data locally
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResult<NetworkImageModel>> updateProfilePic(
  //     XFile pickedFile) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteData = await remoteDataSource.updateProfilePic(pickedFile);
  //       if (remoteData == null)
  //         return const ApiResult.failure(
  //             error: NetworkExceptions.defaultError('Something went wrong'));
  //       return ApiResult.success(data: NetworkImageModel.fromJson(remoteData));
  //     } catch (e) {
  //       if (e is DioError && e.type == DioErrorType.response) {
  //         return ApiResult.failure(
  //             error: NetworkExceptions.defaultError(
  //                 e.response?.data['error']['message']));
  //       } else {
  //         print(e.toString());
  //         return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //         // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //       }
  //     }
  //   } else {
  //     //Or fetch data locally
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResult> changePassword(ChangePasswordParams reqParams) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteData = await remoteDataSource.changePassword(reqParams);
  //       return ApiResult.success(data: remoteData);
  //     } catch (e) {
  //       if (e is DioError &&
  //           e.type == DioErrorType.response &&
  //           e.response?.data != null) {
  //         return ApiResult.failure(
  //             error: NetworkExceptions.defaultError(
  //                 e.response?.data['error']['message']));
  //       } else {
  //         return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //         // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //       }
  //     }
  //   } else {
  //     //Or fetch data locally
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResult<String?>> removeAccount() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteData = await remoteDataSource.removeAccount();
  //       return ApiResult.success(data: remoteData);
  //     } catch (e) {
  //       if (e is DioError &&
  //           e.type == DioErrorType.response &&
  //           e.response?.data != null) {
  //         return ApiResult.failure(
  //             error: NetworkExceptions.defaultError(
  //                 e.response?.data['error']['message']));
  //       } else {
  //         return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //         // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //       }
  //     }
  //   } else {
  //     //Or fetch data locally
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //   }
  // }
}

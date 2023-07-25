import 'package:dio/dio.dart';

import '../../../../core/data/remote/api_result.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/data/remote/network_info.dart';
import '../../domain/login_repository.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../datasource/remote/login_remote_datasource.dart';
import '../datasource/remote/social_login_datasource.dart';
import '../model/req_params/login_params.dart';

class LoginRepositoryImpl extends LoginRepository{
  final LoginRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  // final SocialLoginDataSource socialLoginDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
   required this.remoteDataSource,
    required this.localDataSource,
    // required this.socialLoginDataSource,
    required this.networkInfo});

  @override
  Future<ApiResult<String?>> loginUser(LoginParams loginParams) async{
    if(await networkInfo.isConnected){
      try{
        final remoteData = await remoteDataSource.loginUser(loginParams);

        await localDataSource.cacheToken(
            accessToken: remoteData['accessToken'],
            refreshToken: remoteData['refreshToken']);

        return const ApiResult.success(data: 'Successfully logged in');
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response){
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                e.response?.data['error']['message']
              )
          );
        } else{
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }
      }
    } else{
    //  or fetch data locally
      return const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
    }
  }
  
  @override
  Future<ApiResult<String?>> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }
  
  @override
  Future<ApiResult<String?>> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }
  
  @override
  Future<ApiResult<String?>> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  // @override
  // Future<ApiResult<String?>> loginWithApple() async{
  //   if (await networkInfo.isConnected){
  //     final result = await socialLoginDataSource.loginWithApple();
  //     return result.when(success: (data) async{
  //       final response = await socialLoginDataSource.verifyAppleLogin(
  //           authorizationCode: data);
  //       await localDataSource.cacheToken(
  //           accessToken: response['accessToken'],
  //           refreshToken: response['refreshToken']);
  //       return const ApiResult.success(data: 'Successfully logged in');
  //     }, failure: (error) {
  //       return ApiResult.failure(error: error);
  //     });
  //   } else {
  //     return const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResult<String?>> loginWithFacebook() async{
  //   if (await networkInfo.isConnected){
  //     final result = await socialLoginDataSource.loginWithFacebook();
  //     return result.when(success: (data) async {
  //       final response = await socialLoginDataSource.verifyFacebookLogin(
  //           accessToken: data?.accessToken ?? '' );
  //       await localDataSource.cacheToken(
  //           accessToken: response['accessToken'],
  //           refreshToken: response['refreshToken']);
  //       return const ApiResult.success(data: 'Successfully logged in');
  //     }, failure: (error){
  //       return ApiResult.failure(error: error);
  //     });
  //   }else{
  //     return const ApiResult.failure(error: NetworkExceptions.noInternetConnection());
  //   }
  // }

  // @override
  // Future<ApiResult<String?>> loginWithGoogle() async{
  //   if(await networkInfo.isConnected) {
  //     final result = await socialLoginDataSource.loginWithGoogle();
  //     return result.when(success: (data) async{
  //       final response = await socialLoginDataSource.verifyGoogleLogin(
  //           accessToken: data);
  //       await localDataSource.cacheToken(
  //           accessToken: response['accessToken'],
  //           refreshToken: response['refreshToken']);
  //       return const ApiResult.success(data: 'Successfully logged in');
  //     }, failure: (error){
  //       return ApiResult.failure(error: error);
  //     });
  //   } else {
  //     return const ApiResult.failure(
  //         error: NetworkExceptions.noInternetConnection());
  //     }
  //   }
}
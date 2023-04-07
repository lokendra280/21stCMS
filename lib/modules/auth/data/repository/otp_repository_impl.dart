// import 'package:dio/dio.dart';


// import '../../../../core/data/remote/api_result.dart';
// import '../../../../core/data/remote/network_exceptions.dart';

// import '../../../../core/data/remote/network_info.dart';
// import '../../domain/otp_repository.dart';
// import '../datasource/remote/otp_remote_datasource.dart';


// class OtpRepositoryImpl implements OtpRepository {
//   OtpRemoteDataSource remoteDataSource;
//   NetworkInfo networkInfo;

//   OtpRepositoryImpl(
//       {required this.remoteDataSource, required this.networkInfo});

//   @override
//   Future<ApiResult<String?>>  otpRegister({String? phone, String? email}) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteData = await remoteDataSource.sendOtpRegister(phone: phone,email: email);
//         return ApiResult.success(data: remoteData['message']);
//       } catch (e) {
//         if (e is DioError && e.type == DioErrorType.response) {
//           return ApiResult.failure(
//               error: NetworkExceptions.defaultError(
//                   (e.response?.data['error']['message']).toString()));
//         } else {
//           return ApiResult.failure(error: NetworkExceptions.getDioException(e));
//         }
//       }
//     } else {
//       //Or fetch data locally
//       return const ApiResult.failure(
//           error: NetworkExceptions.noInternetConnection());
//     }
//   }
//   @override
//   Future<ApiResult<String?>>  sendOtpResetPwd({String? phone, String? email}) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteData = await remoteDataSource.sendOtpResetPwd(phone: phone,email: email);
//         return ApiResult.success(data: remoteData);
//       } catch (e) {
//         if (e is DioError && e.type == DioErrorType.response) {
//           return ApiResult.failure(
//               error: NetworkExceptions.defaultError(
//                   (e.response?.data['error']['message']).toString()));
//         } else {
//           return ApiResult.failure(error: NetworkExceptions.getDioException(e));
//         }
//       }
//     } else {
//       //Or fetch data locally
//       return const ApiResult.failure(
//           error: NetworkExceptions.noInternetConnection());
//     }
//   }
// }

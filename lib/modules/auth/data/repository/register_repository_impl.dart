// import 'package:dio/dio.dart';

// import '../../../../core/data/remote/api_result.dart';
// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../../../core/data/remote/network_info.dart';
// import '../../domain/register_repository.dart';
// import '../datasource/remote/register_remote_datasource.dart';
// import '../model/req_params/registration_params.dart';

// class RegisterRepositoryImpl implements RegisterRepository {
//   RegisterRemoteDataSource remoteDataSource;
//   NetworkInfo networkInfo;

//   RegisterRepositoryImpl(
//       {required this.remoteDataSource, required this.networkInfo});

//   @override
//   Future<ApiResult<String?>> registerUser(
//       RegistrationParams registrationParams) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final remoteData = await remoteDataSource.registerUser(registrationParams);
//         return ApiResult.success(data: remoteData['message']);
//       } catch (e) {
//         print('register error is ==> ${e}');
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

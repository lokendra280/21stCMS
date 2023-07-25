
// import '../../../../../core/data/remote/api_endpoints.dart';
// import '../../../../../core/data/remote/dio_client.dart';

// abstract class OtpRemoteDataSource {
//   Future<dynamic> sendOtpRegister({String? phone, String? email});
//   Future<dynamic> sendOtpResetPwd({String? phone, String? email});
// }

// class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
//   late DioClient dioClient;

//   OtpRemoteDataSourceImpl({required this.dioClient});

//   @override
//   Future sendOtpRegister({String? phone, String? email}) async {
//     try {
//       final response = await dioClient.post(
//           APIPathHelper.authAPIs(APIPath.sendOTPRegister),
//           data: {if (phone != null) 'phone': phone else 'email': email});
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future sendOtpResetPwd({String? phone, String? email}) async {
//     try {
//       final response = await dioClient.post(
//           APIPathHelper.authAPIs(APIPath.sendOTPResetPwd),
//           data: {if (phone != null) 'phone': phone else 'email': email});
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

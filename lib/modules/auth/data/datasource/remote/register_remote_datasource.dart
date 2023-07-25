// import '../../../../../core/data/remote/dio_client.dart';
// import '../../../../../core/data/remote/api_endpoints.dart';
// import '../../model/req_params/registration_params.dart';

// abstract class RegisterRemoteDataSource {
//   Future<dynamic> registerUser(RegistrationParams registrationParams);
// }

// class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
//   late DioClient dioClient;

//   RegisterRemoteDataSourceImpl({required this.dioClient});

//   @override
//   Future registerUser(RegistrationParams params) async {
//     try {
//       params
//         ..clientSecret = APIPathHelper.clientSecret
//         ..clientId = APIPathHelper.clientSecret; //setting client info before request
//       final response = await dioClient.post(
//         APIPathHelper.authAPIs(APIPath.registration),
//         data: params.toJson(),
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

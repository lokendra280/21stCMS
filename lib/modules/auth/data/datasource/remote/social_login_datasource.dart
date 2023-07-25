// import 'package:ecommerce_fwear_mobileapp/core/data/remote/api_endpoints.dart';
// import 'package:ecommerce_fwear_mobileapp/core/utils/constant.dart';
// import 'package:ecommerce_fwear_mobileapp/modules/auth/data/model/req_params/login_params.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// import '../../../../../core/data/remote/api_result.dart';
// import '../../../../../core/data/remote/dio_client.dart';
// import '../../../../../core/data/remote/network_exceptions.dart';
// import '../../model/user.dart';

// abstract class SocialLoginDataSource {
//   Future<ApiResult<SocialUser?>> loginWithFacebook();

//   Future<dynamic> verifyFacebookLogin({required String accessToken});

//   Future<ApiResult> loginWithGoogle();

//   Future<ApiResult> loginWithApple();

//   Future<dynamic> verifyGoogleLogin({required String accessToken});

//   Future<dynamic> verifyAppleLogin({required String authorizationCode});
// }

// class SocialLoginDataSourceImpl extends SocialLoginDataSource {
//   late DioClient dioClient;

//   SocialLoginDataSourceImpl({required this.dioClient});

//   @override
//   Future<ApiResult<SocialUser?>> loginWithFacebook() async {
//     try {
//       return const ApiResult.failure(
//           error: NetworkExceptions.defaultError(kFacebookLoginFailMessage));
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future verifyFacebookLogin({required String accessToken}) async {
//     try {
//       final response = await dioClient.post(
//         APIPathHelper.authAPIs(APIPath.socialLogin),
//         data: (SocialLoginParams()..accessToken = accessToken).toJson(),
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ApiResult> loginWithGoogle() async {
//     try {
//       var _googleSignIn = GoogleSignIn(
//         scopes: [
//           'email',
//           'https://www.googleapis.com/auth/contacts.readonly',
//         ],
//       );
//       final googleSignInAccount = await _googleSignIn.signIn();
//       var auth = await googleSignInAccount?.authentication;
//       print('Google idToken ==>${auth?.idToken}');
//       if (auth == null || auth.idToken == null)
//         return const ApiResult.failure(
//             error: NetworkExceptions.defaultError(kGoogleLoginFailMessage));
//       return ApiResult.success(data: auth.idToken);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future<ApiResult> loginWithApple() async {
//     try {
//       final credential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//       );

//       print('DATA${credential}');
//       if (credential == null || credential.authorizationCode == null)
//         return const ApiResult.failure(
//             error: NetworkExceptions.defaultError(kGoogleLoginFailMessage));
//       return ApiResult.success(data: credential.authorizationCode);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future verifyAppleLogin({required String authorizationCode}) async {
//     try {
//       final response = await dioClient.post(
//         APIPathHelper.authAPIs(APIPath.socialLogin),
//         data: (SocialLoginParams(accessToken: authorizationCode, type: 'apple')
//             .toJson()),
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   @override
//   Future verifyGoogleLogin({required String accessToken}) async {
//     try {
//       final response = await dioClient.post(
//         APIPathHelper.authAPIs(APIPath.socialLogin),
//         data: (SocialLoginParams(accessToken: accessToken, type: 'google')
//             .toJson()),
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

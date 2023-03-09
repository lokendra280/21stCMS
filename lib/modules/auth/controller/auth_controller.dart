import 'package:get/get.dart';

import '../domain/repository/auth_repository.dart';

class AuthController extends GetxController {
  final authRepo = Get.find<AuthRepository>();

  RxBool isLoggedIn = false.obs;

  @override
  onInit() async {
    isLoggedIn.value = isAuthenticated();
    super.onInit();
  }

  bool isAuthenticated() {
    return authRepo.isAuthenticated();
  }

  void logout() {
    authRepo.logout();

    isLoggedIn.value = false;
  }

  authorize() async {
    isLoggedIn.value = true;
  }

// Future<bool> logout(BuildContext context) async {
//   final authController = Get.find<AuthController>();
//
//   if (authRepo.isAuthenticated()) {
//     final confirm = await showAnimatedDialog(
//         context: context, widget: const LogoutDialog());
//
//     if (confirm != null && confirm) {
//       authRepo.logout();
//       return true;
//     } else {
//       return false;
//     }
//   } else {
//     await Get.toNamed(LoginScreen.route);
//     return false;
//   }
//
//   // appState.isLoggedIn
//   //     ?
//   //SHOW LOGOUT DIALOG
//   // await Get.defaultDialog(
//   //     title: "Logout",
//   //     middleText: "Do you want to logout?",
//   //     backgroundColor: AppColors.bgColor,
//   //     titleStyle: const TextStyle(color: AppColors.primaryTextColor),
//   //     middleTextStyle: const TextStyle(color: AppColors.primaryTextColor),
//   //     barrierDismissible: false,
//   //     onConfirm: () {
//   //       isLoggedIn.value = false;
//   //       appState.clearData();
//   //       onBtnNavTap(4);
//   //       Get.back();
//   //     },
//   //     onCancel: Get.back)
//   // : Get.toNamed(SignInScreen.route);
// }
}

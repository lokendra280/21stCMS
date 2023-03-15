// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../modules/auth/controller/auth_controller.dart';
// import '../../../modules/auth/presentation/login_screen.dart';

// class AuthPageWrapper extends StatelessWidget {
//   final Widget child;
//   final authController = Get.find<AuthController>();

//   AuthPageWrapper({
//     required this.child,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var isAuthenticated = authController.isLoggedIn.value;
//     if (isAuthenticated)
//       return child;
//     else {
//       return LoginScreen(); // <------ here we return login/signup intro page
//     }
//   }
// }

// class AuthWidgetBuilder extends StatelessWidget {
//   final Widget Function(BuildContext context, bool isAuthenticated) builder;
//   final authController = Get.find<AuthController>();

//   AuthWidgetBuilder({
//     required this.builder,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final isAuthenticated = authController.isLoggedIn.value;

//     return Obx(() => builder(context, authController.isLoggedIn.value));
//   }
// }

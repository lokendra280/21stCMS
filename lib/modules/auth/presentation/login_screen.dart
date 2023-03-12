// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../core/presentation/resources/colors.dart';
// import '../../../core/presentation/resources/size_constants.dart';
// import '../../../core/presentation/widget/forms/buttons.dart';
// import '../../../core/presentation/widget/forms/textfields.dart';

// class LoginScreen extends StatelessWidget {

//   static const route = "/signInScreen";

//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // const Center(child: AppLogoWidget()),
//               SBC.lH,
//               Text(
//                 "welcome_back".tr,
//                 style: Get.textTheme.headline5!
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "please_login_to_continue".tr,
//                 style: Get.textTheme.bodyText2!.copyWith(
//                     fontFamily: GoogleFonts.heebo().fontFamily,
//                     fontWeight: FontWeight.normal),
//               ),
//               SBC.lH,

//               const _LoginFormBuilder(),

//               // LoginBodyWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _LoginFormBuilder extends HookWidget {
//   const _LoginFormBuilder({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final formKey = useMemoized(GlobalKey<FormBuilderState>.new);
//     return GetBuilder<>(builder: (signInController) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: SC.lH),
//         child: FormBuilder(
//           key: formKey,
//           child: Column(
//             children: [
//               PrimaryTextField(
//                 label: "${"email_address".tr}*",
//                 validator: FormBuilderValidators.compose([
//                   // FormBuilderValidators.required(context,
//                   //     errorText: 'Email address is  required'),
//                   // FormBuilderValidators.email(context,
//                   //     errorText: 'Invalid email'),
//                 ]),
//                 onSaved: (value) {
//                   signInController.loginParams.email = value;
//                 },
//               ),
//               SBC.lH,
//               PrimaryTextField(
//                 label:"${"password".tr}*",
//                 isPassword: true,
//                 validator: FormBuilderValidators.compose([
//                   // FormBuilderValidators.required(,
//                   //     errorText: 'Password is  required'),
//                   // FormBuilderValidators.minLength(context, 8,
//                   //     errorText:
//                   //         'Password must NOT have fewer than 8 characters')
//                 ]),
//                 onSaved: (value) {
//                   signInController.loginParams.password = value;
//                 },
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     splashRadius: 10,
//                     activeColor: AppColors.primaryColor,
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     side: const BorderSide(
//                       color: AppColors.caption,
//                       width: 1,
//                     ),
//                     visualDensity: const VisualDensity(
//                         horizontal: VisualDensity.minimumDensity),
//                     value: true,
//                     onChanged: (value) {},
//                   ),
//                   Text(
//                     "remember_me".tr,
//                     style: Get.textTheme.bodyText2!
//                         .copyWith(fontWeight: FontWeight.w600),
//                   ),
//                   SBC.xxLH,
//                   TextButton(
//                       onPressed: () {
//                         // Get.toNamed(ForgotPasswordScreen.route);
//                       },
//                       child: Text(
//                         "forgot_password".tr,
//                         style: Get.textTheme.bodyText2!.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.secondaryTextBtnColor),
//                       )),
//                 ],
//               ),
//               SBC.lH,
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: PrimaryButton(
//                     widget: signInController.isLoginInProcess
//                         ? const CustomCupertinoIndicator()
//                         : null,
//                     title: "login".tr,
//                     onPressed: signInController.isLoginInProcess
//                         ? () {}
//                         : () {
//                             if (formKey.currentState!.saveAndValidate()) {
//                               signInController.login(context,Get.arguments);
//                             }
//                           },
//                     color: AppColors.primaryColor,
//                   )),
//               SBC.xxLH,
//               RichText(
//                 text: TextSpan(
//                   text: "${"not_a_member".tr}  ",
//                   style: Get.textTheme.bodyText2!.copyWith(
//                       fontFamily: GoogleFonts.manrope().fontFamily,
//                       fontWeight: FontWeight.w600),
//                   children: [
//                     TextSpan(
//                         text: "register_now".tr,
//                         style: Get.textTheme.bodyText2!.copyWith(
//                             fontWeight: FontWeight.w600,
//                             color: AppColors.secondaryTextBtnColor),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = signInController.onRegisterNowPressed),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

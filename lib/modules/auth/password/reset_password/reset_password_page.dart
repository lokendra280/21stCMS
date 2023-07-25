// import 'package:auto_route/auto_route.dart';
// import 'package:ecommerce_fwear_mobileapp/core/presentation/widget/forms/buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// import '../../../../core/presentation/resources/colors.dart';
// import '../../../../core/presentation/resources/size_constants.dart';
// import '../../../../core/presentation/resources/ui_assets.dart';
// import '../../../../core/presentation/routes/router.gr.dart';
// import '../../../../core/presentation/widget/forms/textfields.dart';

// class ResetPasswordPage extends StatelessWidget {
//    ResetPasswordPage({Key? key}) : super(key: key);
//   String? email;

//   @override
//   Widget build(BuildContext context) {
//     final _emailKey = GlobalKey<FormBuilderState>();
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         iconTheme: IconThemeData(color: primaryColor),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding:
//             const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 AspectRatio(
//                     aspectRatio: 2.3,
//                     child: SvgPicture.asset(UIAssets.getSvg('FASOWEAR-LOGO.svg'))),
//                 SBC.xLH,
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
//                   margin: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       width: 0.1,
//                     ),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SBC.xLH,
//                       Text(
//                         'Reset Password',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline6!
//                             .copyWith(color: primaryColor),
//                       ),
//                       SBC.lH,
//                       Text(
//                         'Please enter the email associated with your account to receive '
//                             'link with instruction to reset your password ',
//                         style: Theme.of(context).textTheme.caption,
//                         maxLines: 3,
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       // Text('Enter your mobile number', style: Theme.of(context).textTheme.caption,),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: SC.xLW),
//                         child: FormBuilder(
//                           key: _emailKey,
//                           child: Column(
//                             children: [
//                               Align(
//                                   alignment: Alignment.center,
//                                   child: SecondaryTextField(
//                                     maxLength: 20,
//                                     validator: FormBuilderValidators.compose([
//                                       FormBuilderValidators.required(context,
//                                           errorText: "Email is required"),
//                                       FormBuilderValidators.match(
//                                           context, r'(?:\977[- ])?\d{2}-?\d{7,8}',
//                                           errorText: "Enter a valid email address"),
//                                     ]),
//                                     textInputType: TextInputType.emailAddress,
//                                     onSaved: (val) {
//                                       email = val;
//                                     },
//                                     hintTxt: 'Email',
//                                   )),
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               PrimaryButton(
//                                   onPressed: (){
//                                     context.router.navigate( NewPasswordRoute());
//                                   },
//                                   title: 'Continue'),
//                               SBC.lH,
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text('New Member ? ', style: Theme.of(context).textTheme.caption,),
//                                   SBC.mW,
//                                   PrimaryTextButton(title: 'Signup', onPressed: (){
//                                     context.router.push( RegisterOtpRoute());
//                                   },),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Text('By clicking login/Signup you agree to all our', style: Theme.of(context).textTheme.bodyText2,),
//                 PrimaryTextButton(title: 'Terms & Conditions', onPressed: (){}, color: Colors.black,),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

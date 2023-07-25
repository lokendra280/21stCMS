// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../../../core/presentation/resources/colors.dart';
// import '../../../../core/presentation/resources/size_constants.dart';
// import '../../../../core/presentation/resources/ui_assets.dart';
// import '../../../../core/presentation/widget/flushbar.dart';
// import '../../../../core/presentation/widget/forms/buttons.dart';
// import '../../../../core/presentation/widget/forms/textfields.dart';
// import '../../../../core/presentation/widget/toast.dart';
// import '../provider/register_otp_notifier.dart';

// class RegisterOtpPage extends ConsumerWidget {

//   RegisterOtpPage({Key? key}) : super(key: key);

//   String? phone;
//   // final _phoneKey = GlobalKey<FormBuilderFieldState>();
//   final _phoneKey = GlobalKey<FormBuilderState>();
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(registerSendOtpNotifier);
//     ref.listen<AsyncValue>(registerSendOtpNotifier, (previous, next) {
//       next.maybeMap(
//           error: (error) => AppFlushBar.error(
//               context,
//               NetworkExceptions.getErrorMessage(
//                   error.error as NetworkExceptions)),
//           data: (_) {
//             CustomToast.success(
//                 'An OTP has been sent to your mobile number');
//             context.router.navigate(SignUpRoute(phone: phone!));
//           },
//           orElse: () {});
//     });
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
//                         'What\'s Your Mobile Number?',
//                         style: Theme.of(context)
//                             .textTheme
//                             .headline6!
//                             .copyWith(color: primaryColor),
//                       ),
//                       SBC.lH,
//                       Text(
//                         'We will send you an One Time Password (OTP) on it.',
//                         style: Theme.of(context).textTheme.caption,
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       // Text('Enter your mobile number', style: Theme.of(context).textTheme.caption,),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: SC.xLW),
//                         child: FormBuilder(
//                           key: _phoneKey,
//                           child: Column(
//                             children: [
//                               Align(
//                                   alignment: Alignment.center,
//                                   child: SecondaryTextField(
//                                     maxLength: 10,
//                                     validator: FormBuilderValidators.compose([
//                                       FormBuilderValidators.required(context,
//                                           errorText: "Phone is required"),
//                                       FormBuilderValidators.match(
//                                           context, r'(?:\+977[- ])?\d{2}-?\d{7,8}',
//                                           errorText: "Enter a valid mobile number"),
//                                     ]),
//                                     textInputType: TextInputType.number,
//                                     onSaved: (val) {
//                                       phone = val;
//                                     },
//                                     hintTxt: '+977-980XXXXXXX',
//                                   )),
//                               const SizedBox(
//                                 height: 40,
//                               ),
//                               PrimaryButton(
//                                 onPressed: () {
//                                   if(_phoneKey.currentState!.saveAndValidate()){
//                                     ref
//                                         .watch(registerSendOtpNotifier.notifier)
//                                         .sendOtpPhone(phone!);
//                                   }
//                                 },
//                                 title: 'Send Me The Code',
//                                 widget: state is AsyncLoading
//                                     ? const CustomCupertinoIndicator()
//                                     : null,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                     ],
//                   ),
//                 ),

//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

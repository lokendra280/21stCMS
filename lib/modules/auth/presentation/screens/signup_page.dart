// import 'package:ecommerce_fwear_mobileapp/core/presentation/widget/forms/buttons.dart';
// import 'package:ecommerce_fwear_mobileapp/modules/auth/presentation/provider/register_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../../../core/presentation/resources/size_constants.dart';
// import '../../../../core/presentation/resources/ui_assets.dart';
// import '../../../../core/presentation/widget/flushbar.dart';
// import '../../../../core/presentation/widget/forms/textfields.dart';
// import '../../../../core/presentation/widget/toast.dart';
// import '../../data/model/req_params/registration_params.dart';

// class SignUpPage extends HookConsumerWidget {
//   final String? phone;
//    SignUpPage({
//      this.phone,
//     Key? key}) : super(key: key);


//   final _formKey = GlobalKey<FormBuilderState>();
//   final RegistrationParams _registrationParams = RegistrationParams();
//   bool termsAndConditionAccepted = false;
//   bool privacyPolicyAccepted = false;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final checkboxValue = useState(termsAndConditionAccepted && privacyPolicyAccepted);
//     final state = ref.watch(registerUserNotifier);
//     ref.listen<AsyncValue>(registerUserNotifier, (previous, next) {
//       // print('error===> ${NetworkExceptions.getDioException.toString()}');
//       next.maybeMap(
//           error: (error) => AppFlushBar.error(
//               context,
//               NetworkExceptions.getErrorMessage(
//                   error.error as NetworkExceptions),
//           ),
//           data: (_) {
//             CustomToast.success('Register Successfully');
//           },
//           orElse: () {});
//     });
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: FormBuilder(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SBC.xxLH,
//                 Text('Register', style: Theme.of(context).textTheme.headline6,),
//                 SBC.xxLH,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: SC.mW, vertical: SC.mH),
//                   child: Column(
//                     children: [
//                       SecondaryTextField(
//                         fillColor: Colors.transparent,
//                         hintTxt: 'First Name',
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(context,
//                               errorText: "Enter Your First Name",),
//                         ]),
//                         onSaved: (newValue) {
//                           _registrationParams.firstName = newValue;
//                         },
//                       ),
//                       SBC.lH,
//                       SecondaryTextField(
//                         fillColor: Colors.transparent,
//                         hintTxt: 'Last Name',
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(context,
//                           errorText: "Enter your last Name."),
//                         ]),
//                         onSaved: (newValue) {
//                           _registrationParams.lastName = newValue;
//                         },
//                       ),
//                       SBC.lH,
//                       SecondaryTextField(
//                         fillColor: Colors.transparent,
//                         hintTxt: 'Email Address',
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(context,
//                               errorText: "Email is required"),
//                           FormBuilderValidators.email(context),
//                         ]),
//                         onSaved: (newValue) {
//                           _registrationParams.email = newValue;
//                         },
//                       ),
//                       SBC.lH,
//                       SecondaryTextField(
//                         fillColor: Colors.transparent,
//                         textInputType: TextInputType.visiblePassword,
//                         suffixIcon: SvgPicture.asset(UIAssets.getSvg('eye_icon.svg')),
//                         isPassword: true,
//                         hintTxt: 'Password',
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(context,
//                               errorText: 'Enter your password'),
//                         ]),
//                         onSaved: (newValue) {
//                           _registrationParams.password = newValue;
//                         },
//                       ),
//                       SBC.lH,
//                       SecondaryTextField(
//                         fillColor: Colors.transparent,
//                         textInputType: TextInputType.number,
//                         // isPassword: true,
//                         hintTxt: 'OTP Code',
//                         // suffixIcon: SvgPicture.asset(UIAssets.getSvg('eye_icon.svg')),
//                         validator: FormBuilderValidators.compose([
//                           FormBuilderValidators.required(context,
//                           errorText: 'Enter OTP'),
//                         ]),
//                         onSaved: (newValue) {
//                           _registrationParams.otpKey = newValue;
//                         },
//                       ),
//                       SBC.xxLH,
//                       InkWell(
//                         onTap: (){
//                           checkboxValue.value = ! checkboxValue.value;
//                         },
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Checkbox(value: checkboxValue.value, onChanged: (bool? newValue){
//                             }),
//                             Text(
//                               'By creating account you agree to all our \n Terms & Conditions of use, Privacy Policy \n and Cookie Policy ',
//                               style: Theme.of(context).textTheme.caption,
//                               maxLines: 2,
//                             )
//                           ],
//                         ),
//                       ),
//                       SBC.xxLH,
//                       PrimaryButton(
//                           widget: state is AsyncLoading
//                           ? const CustomCupertinoIndicator()
//                           : null,
//                           onPressed: (){
//                             if(_formKey.currentState!.saveAndValidate()) {
//                               _registrationParams.phone = phone;
//                               if(checkboxValue.value == true){
//                                 ref
//                                   .read(registerUserNotifier.notifier)
//                                   .registerUser(_registrationParams);
//                               } else{
//                                 AppFlushBar.error(context, 'Please accept the terms and conditions');
//                               }
//                             }
//                         // context.router.navigate(LoginRoute());
//                       }, title: 'Register')
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

import 'package:auto_route/auto_route.dart';
import 'package:cms/core/presentation/routes/router.gr.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/data/models/result_state.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../../core/presentation/resources/size_constants.dart';
import '../../../../core/presentation/resources/ui_assets.dart';
import '../../../../core/presentation/widget/flushbar.dart';
import '../../../../core/presentation/widget/forms/buttons.dart';
import '../../../../core/presentation/widget/forms/textfields.dart';
import '../../../../core/presentation/widget/toast.dart';
import '../../data/model/req_params/login_params.dart';
import '../provider/login_notifier.dart';

class LoginPage extends ConsumerWidget {
  final LoginParams _loginParams = LoginParams();
  final _formKey = GlobalKey<FormBuilderState>();

  final Function(bool loggedIn)? onLoginCallback;
  final bool? authGuard;

  LoginPage({Key? key, this.authGuard = true, this.onLoginCallback})
      : super(key: key);
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    ref.listen<ResultState>(loginProvider, (previous, next) {
      next.maybeMap(
          error: (error) => AppFlushBar.error(
              context,
              NetworkExceptions.getErrorMessage(
                  error.error as NetworkExceptions)),
          data: (_) {
            CustomToast.success('Logged in Successfully');
            context.router.pushAndPopUntil(
                DashBoardScreen(children: [HomeRouter()]),
                predicate: (_) => false);
            // fetch profile on login
            if (authGuard == false) {
              context.router.pop(true);
            } else {
              onLoginCallback!(true);
            }
          },
          orElse: () {});
    });
    // ..listen<ResultState>(socialLoginNotifier, (previous, next) {
    //   next.maybeMap(
    //       error: (error) => AppFlushBar.error(
    //           context,
    //           NetworkExceptions.getErrorMessage(
    //               error.error as NetworkExceptions)),
    //       data: (_) {
    //         CustomToast.success('Logged in successfully');
    //         //fetch profile on login
    //         if (authGuard == false) {
    //           context.router.pop(true);
    //         } else {
    //           onLoginCallback!(true);
    //         }
    //       },
    //       orElse: () {});
    // });
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SC.xLH, vertical: SC.mH),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SizedBox(
                      height: 160,
                      width: 160,
                      child: SvgPicture.asset(UIAssets.getSvg('logi.svg'))),
                ),
                SecondaryTextField(
                  fillColor: Colors.transparent,
                  hintTxt: "Email Address",
                  textInputType: TextInputType.emailAddress,
                  controller: _emailCtrl,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "Email is required"),
                    // FormBuilderValidators.match(context,r'(?:\+977[- ])?\d{2}-?\d{7,8}',errorText: "Enter a valid mobile number"),
                  ]),
                  onSaved: (newValue) {
                    _loginParams.email = newValue;
                  },
                ),
                SBC.lH,
                SecondaryTextField(
                  fillColor: Colors.transparent,
                  textInputType: TextInputType.visiblePassword,
                  isPassword: true,
                  hintTxt: "Password",
                  controller: _passwordCtrl,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: "Password is required"),
                  ]),
                  onSaved: (newValue) {
                    _loginParams.password = newValue;
                  },
                ),
                SBC.lH,
                Align(
                  alignment: Alignment.centerRight,
                  child: PrimaryTextButton(
                      title: 'Forgot Password',
                      onPressed: () {
                        // context.router.navigate(ResetPasswordRoute());
                      }),
                ),
                SBC.xLH,
                PrimaryButton(
                  title: 'LOG IN',
                  onPressed: () {
                    // context.router.navigate(const DashBoardScreen());
                    if (_formKey.currentState!.saveAndValidate()) {
                      ref
                          .read(loginProvider.notifier)
                          .login(_loginParams); //loginUser
                      print('login value===> ${_loginParams.toJsonLogin()}');
                    }
                  },
                  widget: state is Loading
                      ? const CustomCupertinoIndicator()
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
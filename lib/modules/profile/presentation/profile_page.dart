import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/resources/ui_assets.dart';
import '../../../core/presentation/widget/auth_wrapper.dart';
import '../../../core/presentation/widget/circular_avatar.dart';
import '../../../core/presentation/widget/dialogs.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../../core/presentation/widget/forms/textfields.dart';
import '../../../core/presentation/widget/shimmer_effect.dart';

import '../../auth/controller/auth_controller.dart';

import '../../dashboard/controller/dashboard_controller.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authController = Get.find<AuthController>();

  // @override
  // void initState() {
  //   WidgetsBinding.instance?.addPostFrameCallback(
  //       (_) => Get.find<ProfileController>().getUserInfo());

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _menuTitles = [
      'home'.tr,
      'projects'.tr,
      'inbox'.tr,
      'statements'.tr,
      'about_idea'.tr,
      'privacy_policy'.tr,
      'language'.tr,
      'login'.tr
    ];
    final _iconNameList = [
      'home_trend.svg',
      'project.svg',
      'message_notification.svg',
      'Document.svg',
      'light_bulb.svg',
      'light_bulb.svg',
      'language.svg',
      'login.svg',
    ];
    return Scaffold(
      body: Container(
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 500,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 100, left: SC.lH, right: SC.lH),
                      child: GetBuilder<DashboardController>(
                          builder: (dashboardController) {
                        return MasonryGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 10,
                            itemCount: _menuTitles.length,
                            itemBuilder: (context, index) {
                              if (index == _menuTitles.length - 1) {
                                return AuthWidgetBuilder(
                                  builder: (context, isAuthenticated) {
                                    if (isAuthenticated) {
                                      return _MenuCard(
                                          menuTitlesLength: _menuTitles.length,
                                          index: index,
                                          title: 'logout'.tr,
                                          iconName:
                                              "assets/icons/svg/sign-out.svg");
                                    } else {
                                      return _MenuCard(
                                          menuTitlesLength: _menuTitles.length,
                                          index: index,
                                          title: 'login'.tr,
                                          iconName:
                                              "assets/icons/svg/login.svg");
                                    }
                                  },
                                );
                              } else {
                                return _MenuCard(
                                    menuTitlesLength: _menuTitles.length,
                                    index: index,
                                    title: _menuTitles[index],
                                    iconName:
                                        "assets/icons/svg/${_iconNameList[index]}");
                              }
                            });
                      }),
                    ),
                    // SBC.lH,
                    // _MenuCard(
                    //     index: 12,
                    //     title: 'Privacy Policy',
                    //     iconName: 'assets/icons/svg/privacy-policy.svg'),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _ProfileCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final int menuTitlesLength;
  final int index;
  final String title;
  final String iconName;

  // final profileController = Get.find<ProfileController>();

  _MenuCard({
    Key? key,
    required this.menuTitlesLength,
    required this.index,
    required this.title,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return InkWell(
        onTap: () async {
          if (index == menuTitlesLength - 1) {
            // await profileController.changeAuthStatus(context);
            // if (authController.isLoggedIn.value) {
            //   profileController.getUserInfo();
            // }
          } else {
            switch (index) {
              case 0:
                controller.onBtnNavTap(0);
                break;
              case 1:
                controller.onBtnNavTap(1);
                break;
              case 2:
                controller.onBtnNavTap(2);
                break;

              case 3:
                // Get.toNamed(StatementPage.route);
                // controller.onAccountDeletionClick(context);
                break;

              case 4:
                // Get.toNamed(AboutUs.route);
                break;

              case 5:
                // Get.toNamed(CMS.route);
                break;

              case 6:
                final result = await showAnimatedDialog(
                    context: context, widget: const LanguageDialog());
                // if (result.runtimeType == String) {
                //   Get.find<TranslationController>().changeLanguage = result;
                // }
                break;

              default:
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(SC.mW),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: const Offset(
                    0, // Move to right 10  horizontally
                    10.0, // Move to bottom 10 Vertically
                  ),
                ),
              ]),
          child: Column(
            children: [
              SvgPicture.asset(
                iconName,
                color: Theme.of(context).primaryColor,
                width: 25,
              ),
              SBC.mH,
              Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      );
    });
  }
}

class _ProfileCard extends StatelessWidget {
  final authController = Get.find<AuthController>();

  _ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (profileController) {
      return GestureDetector(
        onTap: () {
          //  if(!profileController.authRepository.isAuthenticated()){
          //    Get.toNamed(LoginScreen.route);
          //  }
        },
        child: SizedBox(
          height: 420,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  margin: const EdgeInsets.only(
                      bottom: 250, left: SC.lH, right: SC.lH),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 20.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: const Offset(
                            0, // Move to right 10  horizontally
                            15.0, // Move to bottom 10 Vertically
                          ),
                        ),
                      ]),
                  // height: 250,

                  child: Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: SC.mH),
                      child: AuthWidgetBuilder(
                        builder: (context, isAuthenticated) {
                          if (!isAuthenticated) {
                            return Column(
                              children: [
                                Text(
                                  'Welcome',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                SBC.lH,
                                const Text(
                                  'Login to view your profile',
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ram",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SBC.lH,
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.mail,
                                          ),
                                          SBC.lW,
                                          Text(
                                            "shyam@gmail.com",
                                          ),
                                        ],
                                      ),
                                      SBC.mH,
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.phone,
                                          ),
                                          SBC.lW,
                                          Text(
                                            "9826540705",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      )),
                ),
              ),
              // Positioned(
              //   top: -25,
              //   left: MediaQuery.of(context).size.width / 2 - 35,
              //   child: Builder(builder: (context) {
              //     if (authController.isLoggedIn.value) {
              //       if (profileController.userInfoModel.profilePicture?.path !=
              //           null)
              //         return Center(
              //           child: Container(
              //             width: 80,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(100),
              //                 border: Border.all(color: Colors.white)),
              //             child: CircularAvatar(
              //               key: UniqueKey(),
              //               imageUrl: profileController
              //                   .userInfoModel.profilePicture!.path!,
              //             ),
              //           ),
              //         );
              //       else
              //         return Center(
              //           child: Container(
              //             // height: 80,
              //             width: 80,
              //             decoration: BoxDecoration(
              //                 color: AppColors.darkWhite,
              //                 borderRadius: BorderRadius.circular(30)),
              //             child: Image.asset(
              //               UIAssets.getImage('profile_avatar.png'),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         );
              //     } else {
              //       return Center(
              //         child: Container(
              //           // height: 80,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               color: AppColors.darkWhite,
              //               borderRadius: BorderRadius.circular(30)),
              //           child: Image.asset(
              //             UIAssets.getImage('profile_avatar.png'),
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //       );
              //     }

              //     // return CircleAvatar(
              //     //   radius: 35,
              //     //   child: Image.asset(
              //     //     UIAssets.getImage('profile_avatar.png'),
              //     //   ),
              //     // );
              //   }),
              // ),
              AuthWidgetBuilder(builder: ((context, isAuthenticated) {
                if (isAuthenticated)
                  return Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      // onTap: () {
                      //   Get.toNamed(ProfileDetailPage.route,
                      //       arguments: FormOperation.edit);
                      // },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10, right: 25),
                        child: Icon(Icons.edit),
                      ),
                    ),
                  );
                else
                  return Container();
              })),
            ],
          ),
        ),
      );
    });
  }
}

class _ProfileLoading extends StatelessWidget {
  const _ProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 300,
              margin:
                  const EdgeInsets.only(bottom: 250, left: SC.lH, right: SC.lH),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(
                        0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ]),
              // height: 250,

              child: Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: SC.mH),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ShimmerWidget(
                          width: 100,
                          height: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SBC.lH,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              // mainAxisAlignment:
                              //     MainAxisAlignment.center,
                              children: [
                                const ShimmerWidget(
                                  width: 10,
                                  height: 10,
                                ),
                                SBC.lW,
                                const ShimmerWidget(width: 150, height: 10),
                              ],
                            ),
                            SBC.lH,
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const ShimmerWidget(
                                  width: 10,
                                  height: 10,
                                  radius: 3,
                                ),
                                SBC.lW,
                                const ShimmerWidget(
                                  width: 100,
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: -25,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: Builder(builder: (context) {
              return const Center(
                child: ShimmerWidget(
                  radius: 200,
                  height: 80,
                  width: 80,
                ),
              );
              return Center(
                child: Container(
                  // height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.darkWhite,
                      borderRadius: BorderRadius.circular(30)),
                  child: Image.asset(
                    UIAssets.getImage('profile_avatar.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );

              // return CircleAvatar(
              //   radius: 35,
              //   child: Image.asset(
              //     UIAssets.getImage('profile_avatar.png'),
              //   ),
              // );
            }),
          ),
        ],
      ),
    );
  }
}

class Language {
  String? code;
  String? lang;

  Language({this.code, this.lang});
}

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  final _formKey = GlobalKey<FormBuilderState>();
  String selectedLanguage = "";

  @override
  Widget build(BuildContext context) {
    var _languages = [
      Language(code: 'en', lang: 'english'),
      Language(lang: 'nepali', code: 'hi'),
    ];
    return WillPopScope(
      onWillPop: () => Future.value(true), //false
      child: Center(
        child: FormBuilder(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Material(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SBC.lH,
                  Text('choose_language'.tr,
                      style: Theme.of(context).textTheme.headline6),
                  SBC.lH,
                  PrimaryDropDownField(
                    items: _languages
                        .map((t) => DropdownMenuItem<String>(
                              child: Text('${t.lang}'.tr),
                              value: t.code,
                            ))
                        .toList(),
                    label: "",
                    onSaved: (value) {
                      selectedLanguage = value!;
                    },
                    // validator: FormBuilderValidators.compose([
                    //   FormBuilderValidators.required(context,
                    //       errorText: 'Language is required')
                    // ]),
                    onChanged: (_) {},
                    hintTxt: 'Not selected',
                  ),
                  SBC.lH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            Get.back(result: false);
                          },
                          title: 'cancel'.tr,
                          textColor: Colors.black,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      SBC.lW,
                      Expanded(
                        child: PrimaryButton(
                          color: AppColors.primaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              Get.back(result: selectedLanguage);
                            }
                          },
                          title: 'apply'.tr,
                        ),
                      ),
                    ],
                  ),
                  SBC.lH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

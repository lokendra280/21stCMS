import 'package:auto_route/auto_route.dart';
import 'package:cms/modules/project/di/injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/data/remote/network_exceptions.dart';
import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/resources/ui_assets.dart';
import '../../../core/presentation/widget/base_widget.dart';
import '../../../core/presentation/widget/circular_avatar.dart';
import '../../../core/presentation/widget/custom_system_overlays.dart';
import '../../../core/presentation/widget/dialogs.dart';
import '../../../core/presentation/widget/empty_view.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../../core/presentation/widget/shimmer_effect.dart';
import '../../auth/di/injection.dart';
import '../../auth/presentation/shared/auth_wrapper.dart';
import '../../../core/presentation/widget/dialogs.dart';
import '../../auth/presentation/shared/logout_dialog.dart';
import '../data/model/response_model/profile_info.dart';
import '../di/injection.dart';
import '../widget/verified.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseWidget(builder: ((context, config, themeData) {
      return Scaffold(
        backgroundColor: const Color(0xffC4C4C4).withOpacity(0.5),
        appBar: AppBar(
          title: Text(
            'Accounts',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          // backgroundColor: primaryColor,
          actions: [
            IconButton(
              onPressed: () {
                showAnimatedDialog(
                    context: context,
                    widget: LogOutDialog(() {
                      ref.read(authProvider).logout();
                    }));
              },
              icon: const Icon(Icons.logout),
              color: Colors.red.shade500,
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(projectInfoNotifier);
                return state.when(data: (data) {
                  ProfileInfo profile = data;
                  return _ProfileInfoHeader(profile);
                }, error: (error, stacktrace) {
                  return EmptyView(
                    message: NetworkExceptions.getErrorMessage(
                        error as NetworkExceptions),
                  );
                }, loading: () {
                  return _ProfileInfoHeaderShimmerView();
                });
              },
            ),
            const ProfileInfoHeaderDetail(),
          ]),
        ),
      );
    }));
  }
}

class _ProfileInfoHeader extends StatelessWidget {
  final ProfileInfo profile;

  const _ProfileInfoHeader(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, config, themeData) {
        return InkWell(
          onTap: () {
            // context.router.navigate(ProfileUpdateRoute(profile: profile));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: SC.sH),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SC.lW, vertical: SC.mH),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 70,
                        height: 70,
                        child: CircularAvatar(
                          imageUrl:
                              'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
                          borderRadius: 50.0,
                        ),
                      ),
                      SBC.xLW,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${profile.data?.user?.name}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(),
                          ),
                          SBC.sH,
                          // if (profile.email != null)
                          //   Text(
                          //     "${profile.email}",
                          //     style: Theme.of(context).textTheme.bodyText2,
                          //   ),
                          SBC.sH,
                          Row(
                            children: [
                              const VerifiedWidget(),
                              SBC.lW,
                              InkWell(
                                child: PrimaryTextButton(
                                  title: 'View/edit',
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           const ProfileUpdatePage()),
                                    // );
                                  },
                                  color: const Color(0xff00C2FF),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProfileInfoHeaderDetail extends ConsumerWidget {
  const ProfileInfoHeaderDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(vertical: SC.mH, horizontal: SC.mW),
          ),
        ],
      ),
    );
  }
}

class _ProfileButtons extends StatelessWidget {
  final String title;
  final Color? color;

  const _ProfileButtons({
    required this.title,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText2!.copyWith(color: color),
    );
  }
}

class _ServiceIcons extends StatelessWidget {
  const _ServiceIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CustomIconButton(title: 'History', iconName: 'bookmark_icon.svg'),
        CustomIconButton(title: 'Payment', iconName: 'card_icon.svg'),
        CustomIconButton(title: 'Affilation', iconName: 'connection_icon.svg'),
        CustomIconButton(title: 'Contact Us', iconName: 'help_icon.svg'),
      ],
    );
  }
}

// class _OrderIcons extends StatelessWidget {
//   const _OrderIcons({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: const [
//         CustomIconButton(title: 'Cancelled', iconName: 'bookmark_icon.svg'),
//         CustomIconButton(title: 'unpaid', iconName: 'card_icon.svg'),
//         CustomIconButton(title: 'To be Shipped', iconName: 'box_icon.svg'),
//         CustomIconButton(title: 'To Receive', iconName: 'delivery_icon.svg'),
//       ],
//     );
//   }
// }

class CustomIconButton extends StatelessWidget {
  final String title;
  final String iconName;
  const CustomIconButton({
    required this.title,
    required this.iconName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            height: 40,
            width: 30,
            padding:
                const EdgeInsets.symmetric(horizontal: SC.sW, vertical: SC.sH),
            child: SvgPicture.asset(UIAssets.getSvg(iconName))),
        Text(
          title,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ProfileInfoHeaderShimmerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(builder: (context, config, themeData) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: SC.mH),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            config.verticalSpaceExtraLarge(),
            SizedBox(
              width: 80,
              height: 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  // child: CustomCachedNetworkImage(imagePath),
                  child: const ShimmerWidget()),
            ),
            config.verticalSpaceSmall(),
            const ShimmerWidget(
              height: 20,
              width: 230,
            ),
            config.verticalSpaceSmall(),
            const ShimmerWidget(
              height: 20,
              width: 200,
            ),
            config.verticalSpaceSmall(),
            const ShimmerWidget(
              height: 20,
              width: 200,
            ),
            SBC.mH,
          ],
        ),
      );
    });
  }
}

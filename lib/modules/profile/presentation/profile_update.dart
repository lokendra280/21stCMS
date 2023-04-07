import 'package:auto_route/auto_route.dart';
import 'package:cms/modules/project/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/data/remote/network_exceptions.dart';
import '../../../core/presentation/resources/size_constants.dart';
import '../../../core/presentation/widget/base_widget.dart';
import '../../../core/presentation/widget/circular_avatar.dart';
import '../../../core/presentation/widget/empty_view.dart';
import '../../../core/presentation/widget/forms/buttons.dart';
import '../../../core/presentation/widget/forms/textfields.dart';
import '../../../core/presentation/widget/shimmer_effect.dart';
import '../data/model/req_model/profile_req_model.dart';
import '../data/model/response_model/profile_info.dart';
import '../di/injection.dart';
import '../widget/verified.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(projectInfoNotifier);
                return state.when(data: (data) {
                  ProfileInfo profile = data;

                  return _ProfileInfoHeader(
                    profile,
                  );
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
            ProfileDetail(),
          ],
        ),
      ),
    );
  }
}

class ProfileDetail extends StatelessWidget {
  ProfileDetail({
    super.key,
  });
  final _updateProfile = ProfileUpdateReqParams();
  // final ProfileInfo profile;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      builder: (context, config, themeData) {
        return Container(
          padding:
              const EdgeInsets.symmetric(horizontal: SC.xLW, vertical: SC.lH),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FormBuilder(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Profile Details',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                      ),
                    ],
                  ),
                  config.verticalSpaceLarge(),
                  PrimaryTextField(
                    // initialValue: ,
                    label: "First Name *",
                    onSaved: (newValue) {
                      // _updateProfile.firstName = newValue;
                    },
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    label: "Last Name *",
                    onSaved: (String? newValue) {},
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    label: "Email Address",
                    onSaved: (String? newValue) {},
                  ),
                  SBC.mH,
                  PrimaryTextField(
                    label: "Primary Contact Number *",
                    onSaved: (String? newValue) {},
                  ),
                  config.verticalSpaceLarge(),
                  PrimaryButton(
                    onPressed: () {},
                    title: 'Save',
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
            // padding: const EdgeInsets.symmetric(vertical: SC.sH),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(35, 47, 62, 1),
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
                                .copyWith(color: Colors.white),
                          ),
                          SBC.sH,
                          // if (profile.email != null)
                          //   Text(
                          //     "${profile.email}",
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .bodyText2!
                          //         .copyWith(color: Colors.white),
                          //   ),
                          SBC.sH,
                          Row(
                            children: [
                              const VerifiedWidget(),
                              SBC.lW,
                            ],
                          ),
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

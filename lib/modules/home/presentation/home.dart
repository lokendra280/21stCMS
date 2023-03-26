import 'package:auto_route/auto_route.dart';
import 'package:cms/core/presentation/routes/router.gr.dart';
import 'package:cms/core/presentation/widget/forms/buttons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../core/presentation/resources/size_constants.dart';
import '../../../../core/presentation/resources/ui_assets.dart';
import '../../../core/presentation/resources/colors.dart';
import '../../../core/presentation/widget/circular_avatar.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../../notification/presentation/notification.dart';

class HomePage extends StatelessWidget {
  final DashboardController dashboardController = Get.find();
  static const String route = "/home";

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (dashboardController) => RefreshIndicator(
        onRefresh: () => dashboardController.loadProjects(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _TitleSection(dashboardController: dashboardController),
            SBC.lH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SC.lW),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // dashboardController.isSliderLoading
                  //     ? const Center(
                  //         child: ShimmerWidget(
                  //         height: 180,
                  //         width: double.maxFinite,
                  //       ))
                  //     : DashboardCarousal(),
                  SBC.sH,
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: SC.mH),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today Attendance',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                        ),
                        const Icon(
                          Icons.alarm,
                          size: 25,
                        ),
                      ],
                    ),
                  ),

                  SBC.xLH,
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: SC.mH),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        context.pushRoute(ProjectRoute());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.task_alt_rounded,
                            size: 25,
                          ),
                          Text(
                            'Total Project',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class CampaignWidget extends StatelessWidget {
  final String? projectName, projectDescription, imageUrl;
  final double? percentFunded;

  const CampaignWidget({
    Key? key,
    this.projectName,
    this.projectDescription,
    this.imageUrl,
    this.percentFunded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(SC.mH),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 130,
                    child: CircularAvatar(
                      imageUrl: imageUrl ??
                          "https://www.gkigroup.com/wp-content/uploads/2020/09/meeting1b-1.jpg",
                      borderRadius: 8,
                    ),
                  ),
                  SBC.lW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SBC.mH,
                        Text(
                          '$projectName',
                          style: Get.textTheme.bodyText1
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SBC.sH,
                        Text(
                          "$projectDescription",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SBC.xLH,
                        SizedBox(
                          width: 100,
                          child: LinearPercentIndicator(
                            padding: EdgeInsets.zero,
                            animation: true,
                            lineHeight: 10.0,
                            animationDuration: 2000,
                            percent:
                                percentFunded! > 1 ? 1 : percentFunded ?? 0,
                            barRadius: const Radius.circular(10),
                            progressColor: AppColors.bluishGrey,
                            backgroundColor: AppColors.bluishGrey,
                            // alignment: MainAxisAlignment.start,
                          ),
                        ),
                        SBC.mH,
                        Text(
                          // "${(percentFunded! * 100).toInt()}% Funded",
                          "${(percentFunded! * 100).toInt()}% Funded",
                          style: Get.textTheme.bodyText2
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SBC.mH,
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: CircleAvatar(
            child: SvgPicture.asset(UIAssets.getSvg("fav_icon.svg")),
            backgroundColor: AppColors.bgColor,
          ),
        )
      ],
    );
  }
}

class _NewProjectWidget extends StatelessWidget {
  final int? index;
  final String? projectName;
  final String? projectDescription;
  final String? projectImage;
  final String? totalGoal;
  final String? totalFunded;
  final double? percentFunded;
  final int? daysLeft;
  final Function()? onPressed;
  final String? imageUrl;

  const _NewProjectWidget(
      {Key? key,
      this.index,
      this.projectName,
      this.projectDescription,
      this.projectImage,
      this.totalGoal,
      this.totalFunded,
      this.percentFunded,
      this.daysLeft,
      this.imageUrl,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _images = [
      "https://mobilehomesonmain.com/wp-content/uploads/2018/08/cavcowest-estate-series-ds-ps-556x320.png",
      "https://s20532.pcdn.co/files/Solar-Canopy-Construction_TUS-800x450.png",
      "https://eige.europa.eu/sites/default/files/styles/eige_original_optimised/public/images/agriculture.jpg?itok=YXbQPCXw",
    ];

    return GestureDetector(
      onTap: onPressed!,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(SC.mH),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                imageUrl == null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: Image.asset(
                          "assets/images/dummy/slider_0.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      )
                    : SizedBox(
                        width: 130,
                        child: CircularAvatar(
                          imageUrl: imageUrl!,
                          borderRadius: 8,
                        )),
                SBC.xXlW,
                SBC.sH,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SBC.mH,
                      Text(
                        '$projectName',
                        style: Get.textTheme.bodyText2
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SBC.lH,
                      // SizedBox(
                      //     child: Html(
                      //       data: projectDescription,
                      //     ),
                      //     height: 75),
                      SBC.xLH,
                      // SizedBox(
                      //   width: 100,
                      //   child: LinearPercentIndicator(
                      //     padding: EdgeInsets.zero,
                      //     animation: true,
                      //     lineHeight: 10.0,
                      //     animationDuration: 2000,
                      //     percent: percentFunded! > 1 ? 1 : percentFunded ?? 0,
                      //     barRadius: const Radius.circular(10),
                      //     progressColor: AppColors.progressIndicatorColor,
                      //     backgroundColor: AppColors.progressIndicatorBgColor,
                      //     // alignment: MainAxisAlignment.start,
                      //   ),
                      // ),
                      // SBC.mH,
                      // Text(
                      //   // "${(percentFunded! * 100).toInt()}% Funded",
                      //   "${(percentFunded! * 100).toInt()}% Funded",
                      //   style: Get.textTheme.bodyText2
                      //       ?.copyWith(fontWeight: FontWeight.w600),
                      // ),
                      SBC.mH,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: CircleAvatar(
              child: SvgPicture.asset(UIAssets.getSvg("fav_icon.svg")),
              backgroundColor: AppColors.bgColor,
            ),
          )
        ],
      ),
    );
  }
}

// final ArticleResponseModel article;

// class _NewsCard extends StatelessWidget {
//   const _NewsCard({
//     required this.article,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       height: 150,
//       padding: const EdgeInsets.all(SC.lW),
//       decoration: BoxDecoration(
//           color: const Color(0xffFAA31A),
//           borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             article.publishedMonth() + " " + article.title,
//             style: Theme.of(context)
//                 .textTheme
//                 .bodyText1
//                 ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
//             maxLines: 4,
//             overflow: TextOverflow.ellipsis,
//           ),
//           SBC.xlH,
//           Text(
//             article.publishedMonth() + " " + article.modifiedOn.year.toString(),
//             style: Theme.of(context)
//                 .textTheme
//                 .caption
//                 ?.copyWith(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _TitleSection extends StatelessWidget {
  DashboardController dashboardController;

  _TitleSection({
    Key? key,
    required this.dashboardController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, right: 5),
      color: AppColors.bluishGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // color: Colors.green,
            width: width * 0.5,
            child: Stack(
              children: [
                ClipPath(
                  clipper: FirstClipper(), //set our custom wave clipper.
                  child: Container(
                    color: Colors.green, height: 60,
                    width: width * 0.5,
                    // alignment: Alignment.center,
                  ),
                ),
                ClipPath(
                  clipper: SecondClipper(), //set our custom wave clipper.
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    width: width * 0.5,
                    // alignment: Alignment.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image(
                      // color: Colors.green,
                      image: AssetImage("assets/images/logo.png"),
                      height: 50),
                ),
              ],
            ),
          ),
          Row(
            children: [
              // SvgPicture.asset("assets/icons/svg/search.svg",
              //     color: AppColors.bgColor),
              SBC.lW,
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()),
                  );
                },
                child: Image.asset(
                  UIAssets.getIcon("notification.png"),
                  height: 25,
                ),
              ),
              SBC.lH,
            ],
          ),
        ],
      ),
    );
  }
}

class MenuIcons extends StatelessWidget {
  final String assetImage;
  final String title;
  final Function() onTap;

  const MenuIcons({
    required this.onTap,
    required this.assetImage,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SBC.xLH,
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: SvgPicture.asset(
                  assetImage,
                  height: 30,
                  width: 30,
                  fit: BoxFit.fitHeight,
                  color: Colors.black.withOpacity(0.8),
                )),
          ),
          SBC.lH,
          Text(title,
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyText2
                  ?.copyWith(fontWeight: FontWeight.w600)),
          SBC.xLH,
        ],
      ),
    );
  }
}

class FirstClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print("${size.height} and ${size.width}");
    // This variable define for better understanding you can direct specify value in quadraticBezierTo method
    var endPoint = Offset(size.width, size.height);
    var controlPoint = Offset(endPoint.dx, endPoint.dy * 0.6);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, endPoint.dy)
      ..lineTo(0, endPoint.dy)
      ..lineTo(endPoint.dx - 80, endPoint.dy)
      // ..moveTo(endPoint.dx - 40, endPoint.dy)
      // ..lineTo(0, (endPoint.dy * 0.8) - 5)
      // ..lineTo(10, endPoint.dy * 0.8 - 40)
      // ..lineTo((endPoint.dx * 0.45) - 10, endPoint.dy * 0.4)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, 0)
      // ..lineTo(endPoint.dx - 10, endPoint.dy * 0.8 - 40)
      // ..lineTo(endPoint.dx, (endPoint.dy * 0.8) - 5)
      // ..lineTo(endPoint.dx, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

class SecondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print("${size.height} and ${size.width}");
    // This variable define for better understanding you can direct specify value in quadraticBezierTo method
    var endPoint = Offset(size.width, size.height);
    var controlPoint = Offset(endPoint.dx - 10, endPoint.dy * 0.6);

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, endPoint.dy)
      ..lineTo(0, endPoint.dy)
      ..lineTo(endPoint.dx - 80, endPoint.dy)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx - 10, 0)
      // ..lineTo(endPoint.dx - 30, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

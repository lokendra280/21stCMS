import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/presentation/resources/colors.dart';
import '../../../../core/presentation/widget/forms/buttons.dart';

class SocialIcon extends StatelessWidget {
  final String? iconSrc;
  final Function? press;
  final bool showLoading;
  const SocialIcon({
    Key? key,
  required  this.iconSrc,
   required this.showLoading,
   required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.bgColor
          ),
          // shape: BoxShape.circle,
        ),
        child: showLoading ? const Padding(
          padding: EdgeInsets.all(4.0),
          child: CustomCupertinoIndicator(brightness: Brightness.light,),
        ) :SvgPicture.asset(
          iconSrc!,
          height: 28,
          width: 28,
        ),
      ),
    );
  }
}

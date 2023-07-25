import 'dart:io';

import 'package:cms/modules/auth/presentation/widgets/social_icon.dart';

import 'package:flutter/cupertino.dart';

import '../../../../core/presentation/resources/size_constants.dart';
import '../../../../core/presentation/resources/ui_assets.dart';
import 'or_divider.dart';

enum SocialLoginType{facebook, google, apple}

extension SocialButtonTypeExtension on SocialLoginType{
  String get iconSrc{
    if(SocialLoginType.facebook ==this){
      return 'facebook.svg';
    }

    if(SocialLoginType.google==this){
      return 'google.svg';
    }

    switch (this) {
      case SocialLoginType.facebook:
        return 'facebook.svg';
      case SocialLoginType.google:
        return 'google.svg';
      case SocialLoginType.apple:
        return 'apple.svg';
      default:
        return 'google.svg';
    }
  }
}

SocialLoginType? selectedSocialButton;

class SocialSignUp extends StatelessWidget{
  final bool? showLoading;
  final Function(SocialLoginType)? onPress;

   SocialSignUp({this.showLoading, this.onPress, Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
         const OrDivider(),
         SBC.xLH,
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: List.generate(
               SocialLoginType.values.length,
                   (index) {
                 if(Platform.isAndroid && SocialLoginType.values[index] == SocialLoginType.apple){
                   return const SizedBox.shrink();
                 }
                 else{
                   return SocialIcon(
                     iconSrc:
                     UIAssets.getSvg(SocialLoginType.values[index].iconSrc),
                     press: () {
                       selectedSocialButton = SocialLoginType.values[index];
                       onPress!(SocialLoginType.values[index]);
                     },
                     showLoading: showLoading! && (selectedSocialButton == SocialLoginType.values[index]),
                   );
                 }

               }),
         ),
       ],
     );
   }
}

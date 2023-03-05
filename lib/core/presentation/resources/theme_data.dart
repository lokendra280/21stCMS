import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

//
// ThemeData appTheme() {
//
//   final textTheme = TextTheme(
//     headline1: TextStyle(
//       fontSize: 30,
//       fontWeight: FontWeight.w400,
//       // color: primaryColorDark,
//     ),
//     headline4: TextStyle(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//       // color: primaryColorDark,
//     ),  headline5: TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//     // color: primaryColorDark,
//   ),
//     headline6: const TextStyle(
//       fontSize: 18,
//     ),
//
//     bodyText1: const TextStyle(
//         fontSize: 15,
//         height: 1.5,
//         fontWeight: FontWeight.normal
//     ),
//     bodyText2: const TextStyle(
//       fontSize: 14,
//     ),
//   );
//
//   final inputDecorationTheme = InputDecorationTheme(
//     contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
//     // fillColor: Color(0XFFF0F0F0),
//     filled: true,
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//       borderSide: BorderSide(
//         color: primaryColor,
//       ),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//       borderSide: BorderSide(
//         color: primaryColor,
//       ),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(5),
//       borderSide: BorderSide(
//         color: primaryColor,
//       ),
//     ),
//     focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(
//           color: primaryColor,
//         ),
//         borderRadius: BorderRadius.circular(5)),
//     alignLabelWithHint: true,
//   );
//   final buttonTheme = ButtonThemeData(
//     colorScheme: ColorScheme.light(primary: primaryColor),
//     buttonColor: primaryColor,
//     textTheme: ButtonTextTheme.primary,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(8),
//     ),
//   );
//
//   return ThemeData(
//     primaryColor: primaryColor,
//     primaryColorDark: primaryColorDark,
//     primaryColorLight: primaryColorLight,
//     // highlightColor: secondaryColor,
//     secondaryHeaderColor: secondaryColorDark,
//     disabledColor: disabledColor,
//     scaffoldBackgroundColor: scaffoldBgColor,
//     fontFamily: 'Roboto',
//     dividerColor: dividerColor,
//     // appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(
//     //   systemNavigationBarColor: primaryColor, // Navigation bar
//     //   statusBarColor: Colors.transparent,
//     //     statusBarIconBrightness: Brightness.light,
//     //     statusBarBrightness: Brightness.light
//     //   // Status bar
//     // )),
//     textTheme: textTheme,
//     // textButtonTheme: TextButtonThemeData(style: ButtonStyle(
//     //   backgroundColor: MaterialStateProperty.all(primaryColor),
//     //   foregroundColor: MaterialStateProperty.all(primaryColor),
//     //   overlayColor: MaterialStateProperty.all(primaryColor),
//     //
//     // )),
//     inputDecorationTheme: inputDecorationTheme,
//     buttonTheme: buttonTheme,
//     colorScheme: ColorScheme(
//
//       primary: primaryColor, onPrimary: Colors.white, background: Colors.white, error: Colors.red, onSecondary: Colors.white, onError: Colors.red, surface: Colors.white, secondary: secondaryColor, onSurface: Colors.black, onBackground: Colors.white, brightness: Brightness.light
//       ,),
//     iconTheme: IconThemeData(color: primaryColor),
//     appBarTheme: AppBarTheme(color: primaryColor,titleTextStyle: textTheme.bodyText1, iconTheme: const IconThemeData(color: Colors.white,size: 20), actionsIconTheme:  const IconThemeData(color: Colors.black,opacity: 0.7, size: 28)),
//
//   );
// }

class AppTheme {
  AppTheme._();

  static final appTheme = AppTheme._();
  static ThemeData kLightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.bgColor,
    canvasColor: AppColors.bgColor,
    appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.bgColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    textTheme: GoogleFonts.manropeTextTheme().copyWith(

        //FONT SIZE 14
        button: const TextStyle(color: AppColors.primaryTextColor),
        //FONT SIZE: 40
        headline1: const TextStyle(color: AppColors.primaryTextColor),
        //FONT SIZE 60
        headline2: const TextStyle(color: AppColors.primaryTextColor),
        //FONT SIZE 48
        headline3:
            const TextStyle(fontSize: 48, color: AppColors.primaryTextColor),
        //FONT SIZE 34
        headline4: const TextStyle(
            fontSize: 34,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w800),
        //FONT SIZE 24
        headline5: const TextStyle(
            fontSize: 24,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600),
        //FONT SIZE 20
        headline6:
            const TextStyle(fontSize: 20, color: AppColors.primaryTextColor),
//FONT SIZE 18
        subtitle1: const TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.normal,
            fontSize: 18),
//FONT SIZE 16
        subtitle2: const TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 16),
        //FONT SIZE 16
        bodyText1: const TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 16,
            fontWeight: FontWeight.normal),
        //FONT SIZE 14
        bodyText2: const TextStyle(
            color: AppColors.primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.normal)),
    sliderTheme: SliderThemeData(
      activeTrackColor: AppColors.primaryColor,
      inactiveTrackColor: const Color(0xffee2343),
      trackHeight: 4.0,
      thumbColor: AppColors.primaryTextColor,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
      overlayColor: Colors.purple.withAlpha(92),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
    ),
  );
}

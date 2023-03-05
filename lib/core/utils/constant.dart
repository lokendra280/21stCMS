import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// this is constant for input decoration
// of textfield for search in main_screen.
const kInputDecorationSearchMainScreen = InputDecoration(
  filled: true,
  fillColor: Color(0xffF6F6F6),
  suffixIcon: Icon(LineAwesomeIcons.search),
  hintText: 'Search Provider ',
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  focusColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
  ),
);

BoxDecoration kBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.15),
      blurRadius: 8,
      spreadRadius: 6,
      offset: const Offset(0, 0),
    ),
  ],
);

const kAppName = 'Salesberry Department Store';
const kAppNameShort = 'Salesberry';
const kDeliveryAddressFetchError = 'Delivery service is not yet available for this area';
const kGooglePlayUrl = '';
const kPlaySoreUrl = '';
const kAppstoreSoreUrl = '';
const kRemoteConfigAndroidKey = 'latestBuildNumberAndroid';
const kRemoteConfigIosKey = 'latestBuildNumberIOS';
const kAppStoreUrl = '';
const kGoogleLoginFailMessage = 'Google Login Failed!!';
const kDeleteUserPolicy = '''
• Your account should not have any pending/active orders or pending refunds/disputes
• Any existing vouchers/coupons in your account will be gone/forfeited
• Our customer service will contact you to verify your identity for security purposes. Salesberry reserves to reject deletion request if any of the criteria has not been met.
• After successful deletion of your account, you will not be able to log in to the account. Account deletion is permanent and will not be reversible.
          ''';
const kAppleLoginFailMessage = 'Apple Login Failed!!';
const kFacebookLoginFailMessage = 'Facebook Login Failed!!';
const kBranchesUrl = 'https://salesberry-web.vercel.app/branches';
const kInAppUpdateDialogDescription =
    '$kAppName recommends that you update to the latest version, so that you can enjoy latest features of the app';

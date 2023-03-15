/// Author:    lokendra gharti
/// Created:   17.01.2022
/// Description:
/// (c) Copyright by lokendragharti3@gmail.com
///

import 'package:flutter_dotenv/flutter_dotenv.dart';

enum APIPath {
  // * Auth apis
  login,
  logOut,
  CATEGORY_URI,
  registration,
  socialLogin,
  sendOTPResetPwd,
  resetPassword,
  changePassword,
  sendOTPRegister,
  refreshToken,
  authToken,
  removeAccount,
  profileInfo,
  updateProfile,
  profilePic,
  imageUpload,
}

class APIPathHelper {
  static final String baseUrl =
      dotenv.env['BASE_URL'] ?? ""; // global api base url

  static String categoryImageUrl(String imageUrl) {
    // category image url
    return '$baseUrl/asset/upload/$imageUrl';
  }

  //* Splash Images
  static String splashImage({bool android = true}) {
    if (android == true) {
      return '$baseUrl/banners?filter[where][agent]=mobile&filter[where][buttonTitle]=Android';
    } else {
      return '$baseUrl/banners?filter[where][agent]=mobile&filter[where][buttonTitle]=IOS';
    }
  }

  //* Splash Images

  // static final String clientId = dotenv.env['CLIENT_ID'] ?? "";
  static final String clientSecret =
      dotenv.env['CLIENT_SECRET'] ?? ""; // global api base url

  static String authAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.login:
        return "/auth/customer-login";
      case APIPath.logOut:
        return "/user/logout";
      case APIPath.authToken:
        return "/auth/token";
      case APIPath.removeAccount:
        return "/remove/account";
      case APIPath.refreshToken:
        return "/token-refresh";
      case APIPath.registration:
        return "/register/customer";
      case APIPath.socialLogin:
        return "/social/login";
      case APIPath.sendOTPRegister:
        return "/register/send-otp";
      case APIPath.sendOTPResetPwd:
        return "/reset-password/sendotp";
      case APIPath.resetPassword:
        return "/reset-password";
      case APIPath.changePassword:
        return "/change-password";
      case APIPath.profileInfo:
        return "/users/me";
      case APIPath.updateProfile:
        return "/profile/update";
      case APIPath.profilePic:
        return "/profile-image";
      default:
        return "";
    }
  }

  // static String assetManager(APIPath imageUpload) {}

  // static String cartWishlistAPIs(APIPath path, {int? id, String? query}) {
  //   switch (path) {
  //     case APIPath.carts:
  //       return "/v1/carts";
  //     case APIPath.addToCart:
  //       return "/v1/carts/add";
  //     case APIPath.cartCount:
  //       return "/carts/count";
  //     case APIPath.deleteFromCart:
  //       return "/v1/carts/items?id=$id";
  //     case APIPath.wishList:
  //       if (id != null) return "/wishlists?id=$id";
  //       return "/wishlists";
  //     case APIPath.couponCode:
  //       return "/coupons/validate/$query";
  //     default:
  //       return "";
  //   }
  // }

  // static String assetManager(APIPath path, {int? id}) {
  //   switch (path) {
  //     case APIPath.imageUpload:
  //       return "/asset-manager/upload-image";
  //     default:
  //       return "";
  //   }
  // }

  // static String locationAPIs(APIPath path, {String? keyword}) {
  //   switch (path) {
  //     case APIPath.provinces:
  //       return "/provinces";
  //     case APIPath.districts:
  //       return "/provinces/$keyword/districts";
  //     case APIPath.municipalities:
  //       return "/districts/$keyword/municipalities";
  //     case APIPath.wards:
  //       return "/municipalities/$keyword/wards";
  //     case APIPath.shippingAddress:
  //       return "/address";
  //     default:
  //       return "";
  //   }
  // }

  // static String orderApis(APIPath path, {int? id, String? query}) {
  //   switch (path) {
  //     case APIPath.buyNow:
  //       return "/orders/buy-now";
  //     case APIPath.confirmOrder:
  //       return "/orders/confirm";
  //     case APIPath.myOrders:
  //       if (query != null)
  //         return "/orders?filter[where][status]=$query"; //&[where][order]=createdOn DESC
  //       return "/orders";
  //     case APIPath.trackMyOrder:
  //       return "/orders?filter[where][tracking_code]=$query";
  //     case APIPath.orderDetail:
  //       return "/orders/$id";
  //     case APIPath.orderStatusChange:
  //       return "/orders/cancel/$id";
  //     default:
  //       return "";
  //   }
  // }

  // static String productAPIs(APIPath path, {int? id, String? query}) {
  //   switch (path) {
  //     case APIPath.categoryListing:
  //       return "/m/category-list";
  //     // return "/categories";
  //     case APIPath.productDetail:
  //       return "/products/$query";
  //     case APIPath.products: // frontend/category/$id/products?
  //       return "/products";
  //     case APIPath.deals: // frontend/category/$id/products?
  //       return "/deals";
  //     case APIPath.productFaq:
  //       if (id != null) return "/faq/question?filter[where][productId]=$id";
  //       return "/faq/question";
  //     case APIPath.productReview:
  //       if (id != null) return "/product-review?filter[where][productId]=$id";
  //       return "/product-review";
  //     case APIPath.brands:
  //       if (query != null)
  //         return "/brands?filter[where][isActive]=true&filter[limit]=$query&&filter[where][image][neq]=";
  //       return "/brands?filter[where][isActive]=true&filter[limit]=10&&filter[where][image][neq]=";
  //     case APIPath.banners:
  //       return "/banners"; //?filter[where][position]=Popup-banner-section
  //     default:
  //       return "";
  //   }
  // }
}

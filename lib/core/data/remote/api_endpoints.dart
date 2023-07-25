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
  refreshToken,
  authToken,

  // * notice related api
  notice,

  // * api related project
  project,

  // * api related to task
  Task,
  //* api related to event
  Event
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
  static final String clientSecret = dotenv.env['CLIENT_SECRET'] ??
      ""; // global api base url

  static String projectAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.project:
        return "/v1/project";
      default:
        return "";
    }
  }

  static String ProjectAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.Task:
        return "v1/task";
      default:
        return "";
    }
  }

  static String EventAPIs(APIPath path, {String? keyord}) {
    switch (path) {
      case APIPath.Event:
        return "v1/event";
      default:
        return "";
    }
  }

  static String noticeAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.project:
        return "/v1/notice";
      default:
        return "";
    }
  }

  static String authAPIs(APIPath path, {String? keyword}) {
    switch (path) {
      case APIPath.login:
        return "/auth/login";
      case APIPath.logOut:
        return "/auth/logout";
      case APIPath.authToken:
        return "/auth/token";

      case APIPath.refreshToken:
        return "/auth/refresh-token";

      default:
        return "";
    }
  }
}

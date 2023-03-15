// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i8;

import '../../../modules/auth/presentation/screens/login_page.dart' as _i2;
import '../../../modules/dashboard/dashboard.dart' as _i6;
import '../../../modules/home/presentation/home.dart' as _i3;
import '../../../modules/notice/presentation/notic_page.dart' as _i4;
import '../../../modules/profile/presentation/profile_page.dart' as _i5;
import '../../../modules/splash_page/presentation/splash_page.dart' as _i1;
import 'auth_guard.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.routeGuard,
  }) : super(navigatorKey);

  final _i9.RouteGuard routeGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          key: args.key,
          authGuard: args.authGuard,
          onLoginCallback: args.onLoginCallback,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
      );
    },
    NoticeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.NoticePage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProfilePage(),
      );
    },
    DashBoardScreen.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.DashBoardScreen(),
      );
    },
    HomeRouter.name: (routeData) {
      final args = routeData.argsAs<HomeRouterArgs>(
          orElse: () => const HomeRouterArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login-page',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i7.RouteConfig(
          NoticeRoute.name,
          path: '/notice-page',
        ),
        _i7.RouteConfig(
          ProfileRouter.name,
          path: 'profile',
          guards: [routeGuard],
        ),
        _i7.RouteConfig(
          DashBoardScreen.name,
          path: 'dashboard',
          children: [
            _i7.RouteConfig(
              HomeRouter.name,
              path: '',
              parent: DashBoardScreen.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    bool? authGuard = true,
    dynamic Function(bool)? onLoginCallback,
  }) : super(
          LoginRoute.name,
          path: '/login-page',
          args: LoginRouteArgs(
            key: key,
            authGuard: authGuard,
            onLoginCallback: onLoginCallback,
          ),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    this.authGuard = true,
    this.onLoginCallback,
  });

  final _i10.Key? key;

  final bool? authGuard;

  final dynamic Function(bool)? onLoginCallback;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, authGuard: $authGuard, onLoginCallback: $onLoginCallback}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i10.Key? key})
      : super(
          HomeRoute.name,
          path: '/home-page',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.NoticePage]
class NoticeRoute extends _i7.PageRouteInfo<void> {
  const NoticeRoute()
      : super(
          NoticeRoute.name,
          path: '/notice-page',
        );

  static const String name = 'NoticeRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRouter extends _i7.PageRouteInfo<void> {
  const ProfileRouter()
      : super(
          ProfileRouter.name,
          path: 'profile',
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i6.DashBoardScreen]
class DashBoardScreen extends _i7.PageRouteInfo<void> {
  const DashBoardScreen({List<_i7.PageRouteInfo>? children})
      : super(
          DashBoardScreen.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashBoardScreen';
}

/// generated route for
/// [_i3.HomePage]
class HomeRouter extends _i7.PageRouteInfo<HomeRouterArgs> {
  HomeRouter({_i10.Key? key})
      : super(
          HomeRouter.name,
          path: '',
          args: HomeRouterArgs(key: key),
        );

  static const String name = 'HomeRouter';
}

class HomeRouterArgs {
  const HomeRouterArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouterArgs{key: $key}';
  }
}

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cms/modules/auth/presentation/screens/login_page.dart';
import 'package:cms/modules/task/presentation/task.dart';
import 'package:flutter/cupertino.dart';

import '../../../modules/Event/presentation/event_page.dart';
import '../../../modules/dashboard/dashboard.dart';
import '../../../modules/home/presentation/home.dart';
import '../../../modules/notice/presentation/notic_page.dart';
import '../../../modules/profile/presentation/profile_page.dart';
import '../../../modules/project/presentation/project_page.dart';
import '../../../modules/splash_page/presentation/splash_page.dart';
import 'auth_guard.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: NoticePage),
    AutoRoute(page: EventPage),
    AutoRoute(page: TaskPage),
    AutoRoute(page: ProjectPage),
    AutoRoute(
      path: 'profile',
      name: 'profileRouter',
      page: ProfilePage,
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: DashBoardScreen,
      path: 'dashboard',
      children: [
        CustomRoute(
            path: '',
            name: 'homeRouter',
            page: HomePage,
            transitionsBuilder: TransitionsBuilders.slideTop)
      ],
    )
  ],
)
class $AppRouter {}

class MyRouteObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    print('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('New route popped: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print('New route removed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    print('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    print('Tab route re-visited: ${route.name}');
  }
}

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/routes/router.gr.dart';
import '../../di/injection.dart';
import '../screens/login_page.dart';

// * checks whether app is authenticated or not and return page accordingly
class AuthPageWrapper extends ConsumerWidget {
  final Widget child;

  const AuthPageWrapper({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isAuthenticated = ref.watch(authProviderStateNotifierProvider);
    if (isAuthenticated)
      return child;
    else {
      return LoginPage(); // <------ here we return login/signup intro page
    }
  }
}
// * checks whether app is authenticated or not and return page accordingly

//* checks whether app is authenticated or not and return widget accordingly
class AuthWidgetWrapper extends ConsumerWidget {
  final Widget child;
  final Widget? placeHolderChild;

  const AuthWidgetWrapper({
    required this.child,
    this.placeHolderChild,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isAuthenticated = ref.watch(authProviderStateNotifierProvider);
    if (isAuthenticated)
      return child;
    else {
      if (placeHolderChild != null)
        return placeHolderChild!;
      else
        return const SizedBox.shrink(); // <------ here we return empty layout
    }
  }
}
//* checks whether app is authenticated or not and return widget accordingly

class AuthWidgetBuilder extends ConsumerWidget {
  final Widget Function(BuildContext context, bool isAuthenticated) builder;

  const AuthWidgetBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isAuthenticated = ref.watch(authProviderStateNotifierProvider);
    return builder(context, isAuthenticated);
  }
}

//Handy Method for handling authentication

void authFunction(
    bool isAuthenticated, Function function, BuildContext context) {
  if (isAuthenticated) {
    function();
  } else {
    context.router.navigate(LoginRoute(authGuard: false));
  }
}

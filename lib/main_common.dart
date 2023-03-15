/// Author:    Lokendra Gharti
/// Created:   19.12.2022
/// Description:
/// (c) Copyright by lokendragharti3@gmail.com.
///*/

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cms/modules/dashboard/dashboard.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/presentation/resources/theme_data.dart';

import 'core/presentation/routes/di.dart';
import 'core/presentation/routes/router.dart';
import 'core/utils/constant.dart';
import 'modules/auth/presentation/screens/login_page.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dotenv;
  // await dotenv.load(
  //     fileName: "assets/.env",
  //     mergeWith: Platform.environment); //dotenv.env['BASE_URL'];
  //Todo: await configureDependencies(); //init dependencies

  // await Firebase.initializeApp();

  //If subscribe based sent notification then use this token
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);
  //
  // //If subscribe based on topic then use this
  // await FirebaseMessaging.instance.subscribeToTopic('new-year');

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

// changing system ui overflow color to transparent so that we can use our own custom color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  //disable Landscape mode
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class FasoWear extends ConsumerStatefulWidget {
  const FasoWear({super.key});

  @override
  ConsumerState createState() => ApplicationState();
}

// FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// final analyticsProvider =
// Provider((ref) => FirebaseAnalytics.instance); //di injection

class ApplicationState extends ConsumerState<FasoWear> {
  @override
  Widget build(BuildContext context) {
    final _appRouter = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: kAppName,
      locale: DevicePreview.locale(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: appTheme(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          SentryNavigatorObserver(),
          MyRouteObserver(),
          //FirebaseAnalyticsObserver(analytics: ref.watch(analyticsProvider)),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

// A Counter example implemented with riverpod with Logger

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

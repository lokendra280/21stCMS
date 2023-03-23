/// Author:    Lokendra Gharti
/// Created:   17.03.2022
/// Description:
/// (c) Copyright by 21st tech pvt ltd.
///*/

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'core/presentation/resources/theme_data.dart';
import 'core/presentation/routes/di.dart';
import 'core/presentation/routes/router.dart';
import 'core/utils/constant.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }

  //environment file
  await dotenv.load(
      fileName: "assets/.env",
      mergeWith: Platform.environment); //dotenv.env['BASE_URL'];

  // OneSignalNotificationServices.instance.initializeOneSignalNotification();

  // await Firebase.initializeApp();
// changing system ui overflow color to transparent so that we can use our own custom color
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  //disable Landscape mode
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //initializing hive
  await _initializeHive();
}

Future _initializeHive() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  //opening small boxes to synchronously fetch some important values
  // await Hive.openBox(DbConstants.userProfileBox); // opening user information
}

class Application extends ConsumerStatefulWidget {
  @override
  ConsumerState createState() => ApplicationState();
}

// FirebaseAnalytics analytics = FirebaseAnalytics.instance;

// final analyticsProvider =
//     Provider((ref) => FirebaseAnalytics.instance); //di injection

class ApplicationState extends ConsumerState<Application> {
  @override
  Widget build(BuildContext context) {
    final _router = ref.watch(routerProvider);
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: kAppName,
      routerDelegate: AutoRouterDelegate(
        _router,
        navigatorObservers: () => [
          SentryNavigatorObserver(),
          MyRouteObserver(),
        ],
      ),
      routeInformationParser: _router.defaultRouteParser(),
      locale: DevicePreview.locale(context),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      // theme: appTheme(),
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

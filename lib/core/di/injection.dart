
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../modules/auth/di/injection.dart';
import '../data/remote/api_endpoints.dart';
import '../data/remote/auth_interceptor.dart';
import '../data/remote/dio_client.dart';
import '../data/remote/network_info.dart';

final GetIt getIt = GetIt.instance;
String get  baseUrl => APIPathHelper.baseUrl;
final dioProvider = Provider((ref) => Dio());
final connectionChecker = Provider((ref) => InternetConnectionChecker());
final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl(dataConnectionChecker: ref.watch(connectionChecker)));
final sharedPrefsProvider = Provider((ref) => const FlutterSecureStorage());
final authInterceptorProvider =
Provider((ref) => AuthInterceptor(ref.watch(dioProvider),ref.watch(sharedPrefsProvider),ref.watch(authProvider)));
final dioClientProvider = Provider((ref) => DioClient(
    baseUrl: baseUrl,
    dio: ref.watch(dioProvider),
    interceptor: ref.watch(authInterceptorProvider)));

@InjectableInit()
void configureInjection(String env) {
  init(getIt, environment: env);
}

void init(GetIt getIt, {required String environment}) {
}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/di/injection.dart';
import '../data/datasource/local/auth_local_datasource.dart';
import '../data/datasource/remote/login_remote_datasource.dart';
import '../data/datasource/remote/otp_remote_datasource.dart';
import '../data/datasource/remote/register_remote_datasource.dart';
import '../data/datasource/remote/social_login_datasource.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/login_repository_impl.dart';
import '../data/repository/otp_repository_impl.dart';
import '../data/repository/register_repository_impl.dart';
import '../domain/auth_repository.dart';
import '../domain/login_repository.dart';
import '../domain/otp_repository.dart';
import '../domain/register_repository.dart';
import '../presentation/provider/auth_notifier.dart';


// * local data source
final _localAuthDataSource = Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
final _authLocalDataSource = Provider<AuthLocalDataSource>((ref) => AuthLocalDataSourceImpl(secureStorage: ref.watch(sharedPrefsProvider)));
// * local data source

// * remote data source
final _loginRemoteDataSource = Provider<LoginRemoteDataSource>((ref) =>
    LoginRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// final _otpRemoteDataSource = Provider<OtpRemoteDataSource>((ref) => OtpRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// final _registerRemoteDaraSource = Provider<RegisterRemoteDataSource>((ref) => RegisterRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// // final _resetPwdRemoteDataSource = Provider<ResetPwdRemoteDataSource>((ref) => ResetPwdRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// final _socialLoginRemoteDataSource = Provider<SocialLoginDataSource>((ref) => SocialLoginDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// // * remote data source

//*  Repo implementation
final authRepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        localDataSource: ref.watch(_localAuthDataSource),
        networkInfo: ref.watch(networkInfoProvider)));

final loginRepositoryProvider = Provider<LoginRepository>((ref) =>
    LoginRepositoryImpl(
        remoteDataSource: ref.watch(_loginRemoteDataSource),
        networkInfo: ref.watch(networkInfoProvider),
        // socialLoginDataSource: ref.watch(_socialLoginRemoteDataSource),
        localDataSource: ref.watch(_authLocalDataSource)));
// final otpRepositoryProvider = Provider<OtpRepository>((ref) =>
//     OtpRepositoryImpl(
//         remoteDataSource: ref.watch(_otpRemoteDataSource),
//         networkInfo: ref.watch(networkInfoProvider),
//     ));
// final registerRepositoryProvider = Provider<RegisterRepository>((ref) =>
//     RegisterRepositoryImpl(
//         remoteDataSource: ref.watch(_registerRemoteDaraSource),
//         networkInfo: ref.watch(networkInfoProvider),
//     ));

// final resetPasswordRepositoryProvider = Provider<ResetPwdRepository>((ref) => ResetPwdRepositoryImpl(remoteDataSource: ref.watch(_resetPwdRemoteDataSource), networkInfo: ref.watch(networkInfoProvider),));
// * Repo implementation

// * auth providers
final authProvider = Provider((ref) => AuthNotifier(ref.watch(authRepositoryProvider)));
final authProviderStateNotifierProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => ref.watch(authProvider));

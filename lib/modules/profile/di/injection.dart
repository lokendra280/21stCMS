// * providers/notifiers
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../data/data_source/remote/profile_remote_datasource.dart';
import '../data/repository/profile_repository_impl.dart';
import '../domain/profile_repository.dart';
import '../presentation/notifiers/login_response.dart';
import '../presentation/notifiers/profile_info_notifier.dart';

// * remote data source
final _profileRemoteDataSource = Provider<ProfileRemoteDataSource>((ref) =>
    ProfileRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// * remote data source

// *  Repo implementation
final profileRepositoryProvider = Provider<ProfileRepository>((ref) =>
    ProfileRepositoryImpl(
        networkInfo: ref.watch(networkInfoProvider),
        remoteDataSource: ref.watch(_profileRemoteDataSource)));

// *  Repo implementation

final profileInfoNotifier =
    StateNotifierProvider<ProfileInfoNotifier, AsyncValue>((ref) =>
        ProfileInfoNotifier(repo: ref.watch(profileRepositoryProvider)));


// final loginInfoNotifier = StateNotifierProvider<LoginInfoNotifier, AsyncValue>((ref) => 
// LoginInfoNotifier(repo: ref.watch())
// )

// * order - providers/notifiers
 

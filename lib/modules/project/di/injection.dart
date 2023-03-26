import 'package:cms/modules/project/data/data_sources/project_remote_data_source.dart';
import 'package:cms/modules/project/domain/project_repository.dart';
import 'package:cms/modules/project/repository/project_repository_imp.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../presentation/notifier/project_info_notfier.dart';

/// * remote data source
final _projectRemoteDataSource = Provider<ProjectRemoteDataSource>(
    (ref) => TaskRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// *  Repo implementation
final ProjectRepositoryProvider = Provider<ProjectRepository>((ref) =>
    ProjectRepositoryImpl(
        networkInfo: ref.watch(networkInfoProvider),
        remoteDataSource: ref.watch(_projectRemoteDataSource)));
// * Provider/notifier
final projectInfoNotifier =
    StateNotifierProvider<ProjectInfoNotifier, AsyncValue>((ref) =>
        ProjectInfoNotifier(repo: ref.watch(ProjectRepositoryProvider)));

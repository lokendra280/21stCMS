import 'package:cms/modules/Event/data/data_source/status_remote_data_source.dart';
import 'package:cms/modules/Event/domain/event_repository.dart';
import 'package:cms/modules/Event/presentation/notifier/event_notifier.dart';
import 'package:cms/modules/project/data/data_sources/project_remote_data_source.dart';
import 'package:cms/modules/project/domain/project_repository.dart';
import 'package:cms/modules/project/repository/project_repository_imp.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';
import '../repository/event_repository_imp.dart';

/// * remote data source
final _eventRemoteDataSource = Provider<EventRemoteDataSource>((ref) =>
    EventRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// *  Repo implementation
final EventRepositoryProvider = Provider<EventRepository>((ref) =>
    EventRepositoryImpl(
        networkInfo: ref.watch(networkInfoProvider),
        remoteDataSource: ref.watch(_eventRemoteDataSource)));
// * Provider/notifier
final eventInfoNotifier = StateNotifierProvider<EventInfoNotifier, AsyncValue>(
    (ref) => EventInfoNotifier(repo: ref.watch(EventRepositoryProvider)));

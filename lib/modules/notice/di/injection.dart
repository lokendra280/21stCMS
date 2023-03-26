import 'package:cms/modules/notice/data/data_source/notice_remote_data_source.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:cms/modules/notice/presentation/notifier/notice_notifer.dart';
import 'package:cms/modules/notice/repository/notice_repository_imp.dart';
import 'package:cms/modules/project/data/data_sources/project_remote_data_source.dart';
import 'package:cms/modules/project/domain/project_repository.dart';
import 'package:cms/modules/project/repository/project_repository_imp.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/di/injection.dart';

/// * remote data source
final _noticeRemoteDataSource = Provider<NoticeRemoteDataSource>((ref) =>
    NoticeRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
// *  Repo implementation
final NoticeRepositoryProvider = Provider<NoticeRepository>((ref) =>
    NoticeRepositoryImpl(
        remoteDataSource: ref.watch(_noticeRemoteDataSource),
        networkInfo: ref.watch(networkInfoProvider)));
// * Provider/notifier
final noticeInfoNotifier =
    StateNotifierProvider<NoticeDetailNotifier, AsyncValue>((ref) =>
        NoticeDetailNotifier(repo: ref.watch(NoticeRepositoryProvider)));

import 'package:cms/core/data/remote/network_info.dart';
import 'package:cms/core/di/injection.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:cms/modules/task/data/data_source/task_remote_data_source.dart';
import 'package:cms/modules/task/domain/task_repository.dart';
import 'package:cms/modules/task/presentation/notifier/task_info_notfier.dart';
import 'package:cms/modules/task/repository/task_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// * remote data source
final _taskRemoteDataSource = Provider<TaskRemoteDataSource>(
    (ref) => TaskRemoteDataSourceImpl(dioClient: ref.watch(dioClientProvider)));
//* Repo implementation

// *  Repo implementation
final TaskRepositoryProvider = Provider<TaskRepository>((ref) =>
    TaskRepositoryImpl(
        networkInfo: ref.watch(networkInfoProvider),
        remoteDataSource: ref.watch(_taskRemoteDataSource)));
// * Provider/notifier
final taskInfoNotifier = StateNotifierProvider<TaskInfoNotifier, AsyncValue>(
    (ref) => TaskInfoNotifier(repo: ref.watch(TaskRepositoryProvider)));

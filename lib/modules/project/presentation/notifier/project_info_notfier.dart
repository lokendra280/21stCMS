import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/project/domain/project_repository.dart';
import 'package:cms/modules/task/domain/task_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectInfoNotifier extends StateNotifier<AsyncValue> {
  ProjectInfoNotifier({required this.repo}) : super(const AsyncData('')) {
    getProjectInfo();
  }
  final ProjectRepository repo;
  Future<void> getProjectInfo() async {
    state = const AsyncLoading();
    final response = await repo.getProjectinfo();
    response.when(success: (data) {
      state = AsyncData(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}

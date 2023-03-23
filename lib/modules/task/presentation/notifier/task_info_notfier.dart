import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/task/domain/task_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskInfoNotifier extends StateNotifier<AsyncValue> {
  TaskInfoNotifier({required this.repo}) : super(const AsyncData('')) {
    getTaskInfo();
  }
  final TaskRepository repo;
  Future<void> getTaskInfo() async {
    state = const AsyncLoading();
    final response = await repo.getTaskProfile();
    response.when(success: (data) {
      state = AsyncData(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}

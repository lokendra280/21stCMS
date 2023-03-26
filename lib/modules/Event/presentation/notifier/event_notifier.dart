import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/Event/domain/event_repository.dart';
import 'package:cms/modules/project/domain/project_repository.dart';
import 'package:cms/modules/task/domain/task_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EventInfoNotifier extends StateNotifier<AsyncValue> {
  EventInfoNotifier({required this.repo}) : super(const AsyncData('')) {
    getProjectInfo();
  }
  final EventRepository repo;
  Future<void> getProjectInfo() async {
    state = const AsyncLoading();
    final response = await repo.getEventinfo();
    response.when(success: (data) {
      state = AsyncData(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}

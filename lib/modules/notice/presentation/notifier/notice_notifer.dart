import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoticeDetailNotifier extends StateNotifier<AsyncValue> {
  final NoticeRepository repo;
  NoticeDetailNotifier({required this.repo}) : super(const AsyncLoading());

  Future<void> getNotice(String) async {
    state = const AsyncValue.loading();
    ApiResult result = await repo.getNotice();
    result.when(success: (data) {
      state = AsyncValue.data(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}

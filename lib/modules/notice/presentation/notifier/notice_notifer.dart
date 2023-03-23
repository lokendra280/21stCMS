import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoticeDetailNotifier extends StateNotifier<AsyncValue> {
  NoticeRepository repository;
  NoticeDetailNotifier({required this.repository})
      : super(const AsyncLoading());

  Future<void> getNotice(String) async {
    state = const AsyncValue.loading();
    ApiResult result = await repository.getNotice();
    result.when(success: (data) {
      state = AsyncValue.data(data);
    }, failure: (error) {
      state = AsyncValue.error(error, StackTrace as StackTrace);
    });
  }
}

import 'package:cms/modules/notice/data/model/notice_model.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartz/dartz.dart';

class NoticeController extends StateNotifier<AsyncValue<NoticeModel>> {
  NoticeController(this._noticeRepository) : super(const AsyncValue.loading());

  final NoticeRepository _noticeRepository;

  fetchNotice() async {
    final result = await _noticeRepository.getNotice();
  }
}

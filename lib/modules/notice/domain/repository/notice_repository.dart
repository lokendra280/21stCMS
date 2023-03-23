import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/notice/data/model/notice_model.dart';

abstract class NoticeRepository {
  Future<ApiResult<NoticeModel>> getNotice();
}

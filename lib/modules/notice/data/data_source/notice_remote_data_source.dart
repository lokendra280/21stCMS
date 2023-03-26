import 'package:cms/core/data/remote/api_endpoints.dart';
import 'package:cms/core/data/remote/dio_client.dart';

abstract class NoticeRemoteDataSource {
  Future<dynamic> getNoticeInfo();
}

class NoticeRemoteDataSourceImpl implements NoticeRemoteDataSource {
  late DioClient dioClient;

  NoticeRemoteDataSourceImpl({required this.dioClient});
  @override
  Future getNoticeInfo() async {
    try {
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.notice));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

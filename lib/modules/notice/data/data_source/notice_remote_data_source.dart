import 'package:cms/core/data/remote/api_endpoints.dart';
import 'package:cms/core/data/remote/dio_client.dart';
import 'package:cms/modules/auth/domain/auth_repository.dart';

abstract class NoticeRemoteDataSource {
  Future<dynamic> getnoticeDetail(int noticeId);
}

class NoticeRemoteDataSourceImpl extends NoticeRemoteDataSource {
  final DioClient dioClient;
  final AuthRepository repository;

  NoticeRemoteDataSourceImpl(
      {required this.dioClient, required this.repository});
  @override
  Future getnoticeDetail(int noticeId) async {
    try {
      if (await repository.isAuthenticated()) {
        final response =
            await dioClient.get(APIPathHelper.noticeAPIs(APIPath.notice));
        return response;
      }
    } catch (e) {
      rethrow;
    }
  }
}

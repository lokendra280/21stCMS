import 'package:cms/core/data/remote/api_endpoints.dart';
import 'package:cms/core/data/remote/dio_client.dart';

abstract class TaskRemoteDataSource {
  Future<dynamic> getTaskInfo();
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  late DioClient dioClient;

  TaskRemoteDataSourceImpl({required this.dioClient});
  @override
  Future getTaskInfo() async {
    try {
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.Task));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

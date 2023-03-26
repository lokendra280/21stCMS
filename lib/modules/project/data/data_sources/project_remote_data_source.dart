import 'package:cms/core/data/remote/api_endpoints.dart';
import 'package:cms/core/data/remote/dio_client.dart';

abstract class ProjectRemoteDataSource {
  Future<dynamic> getProjectInfo();
}

class TaskRemoteDataSourceImpl implements ProjectRemoteDataSource {
  late DioClient dioClient;

  TaskRemoteDataSourceImpl({required this.dioClient});
  @override
  Future getProjectInfo() async {
    try {
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.project));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

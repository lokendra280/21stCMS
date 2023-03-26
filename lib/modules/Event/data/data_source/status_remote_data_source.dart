import 'package:cms/core/data/remote/api_endpoints.dart';
import 'package:cms/core/data/remote/dio_client.dart';

abstract class EventRemoteDataSource {
  Future<dynamic> getEventInfo();
}

class EventRemoteDataSourceImpl implements EventRemoteDataSource {
  late DioClient dioClient;

  EventRemoteDataSourceImpl({required this.dioClient});
  @override
  Future getEventInfo() async {
    try {
      final response =
          await dioClient.authGet(APIPathHelper.authAPIs(APIPath.Event));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

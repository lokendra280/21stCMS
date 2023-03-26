import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/Event/data/data_source/status_remote_data_source.dart';
import 'package:cms/modules/Event/data/model/event_model.dart';
import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/Event/domain/event_repository.dart';
import 'package:dio/dio.dart';

import '../../../core/data/remote/network_info.dart';

class EventRepositoryImpl extends EventRepository {
  final EventRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  EventRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});
  @override
  Future<ApiResult<EventModel>> getEventinfo() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getEventInfo();
        return ApiResult.success(data: EventModel.fromJson(remoteData));
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  e.response?.data['error']['message']));
        } else {
          print(e.toString());
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
          // return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }
      }
    } else {
      //Or fetch data locally
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }
}

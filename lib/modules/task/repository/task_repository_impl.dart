import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/core/data/remote/network_info.dart';
import 'package:cms/modules/task/data/data_source/task_remote_data_source.dart';
import 'package:cms/modules/task/data/model/task_model.dart';
import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/task/domain/task_repository.dart';
import 'package:dio/dio.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<ApiResult<TaskModel>> getTaskProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getTaskInfo();
        return ApiResult.success(data: TaskModel.fromJson(remoteData));
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

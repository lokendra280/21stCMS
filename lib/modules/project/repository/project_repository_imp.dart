import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/project/data/data_sources/project_remote_data_source.dart';
import 'package:cms/modules/project/data/models/project_model.dart';

import 'package:cms/core/data/remote/api_result.dart';
import 'package:dio/dio.dart';

import '../../../core/data/remote/network_info.dart';
import '../domain/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ProjectRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<ApiResult<ProjectModel>> getProjectinfo() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getProjectInfo();
        return ApiResult.success(data: ProjectModel.fromJson(remoteData));
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

import 'package:cms/core/data/remote/network_exceptions.dart';
import 'package:cms/modules/Event/data/model/event_model.dart';
import 'package:cms/modules/notice/data/data_source/notice_remote_data_source.dart';
import 'package:cms/modules/notice/data/model/notice_model.dart';
import 'package:cms/modules/notice/domain/repository/notice_repository.dart';
import 'package:cms/modules/project/data/data_sources/project_remote_data_source.dart';
import 'package:cms/modules/project/data/models/project_model.dart';

import 'package:cms/core/data/remote/api_result.dart';
import 'package:dio/dio.dart';

import '../../../core/data/remote/network_info.dart';

class NoticeRepositoryImpl extends NoticeRepository {
  final NoticeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  NoticeRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<ApiResult<NoticeModel>> getNotice() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getNoticeInfo();
        return ApiResult.success(data: NoticeModel.fromJson(remoteData));
      } catch (e) {
        if (e is DioError && e.type == DioErrorType.response) {
          return ApiResult.failure(
              error: NetworkExceptions.defaultError(
                  e.response?.data['error']['message']));
        } else {
          print(e.toString());
          return ApiResult.failure(error: NetworkExceptions.getDioException(e));
        }
      }
    } else {
      return const ApiResult.failure(
          error: NetworkExceptions.noInternetConnection());
    }
  }
}

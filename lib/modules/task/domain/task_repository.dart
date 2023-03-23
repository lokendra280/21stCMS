import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/task/data/model/task_model.dart';

abstract class TaskRepository {
  Future<ApiResult<TaskModel>> getTaskProfile();
}

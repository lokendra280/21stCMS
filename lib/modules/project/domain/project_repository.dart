import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/project/data/models/project_model.dart';
import 'package:cms/modules/task/data/model/task_model.dart';

abstract class ProjectRepository {
  Future<ApiResult<ProjectModel>> getProjectinfo();
}

import 'package:cms/core/data/remote/api_result.dart';
import 'package:cms/modules/Event/data/model/event_model.dart';
import 'package:cms/modules/project/data/models/project_model.dart';
import 'package:cms/modules/task/data/model/task_model.dart';

abstract class EventRepository {
  Future<ApiResult<EventModel>> getEventinfo();
}

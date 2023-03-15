/// Author:   Lokendra Gharti
/// Created:   17.01.2022
/// Description:
/// (c) Copyright by 21sttech.com.
///*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({required T data}) = Success<T>;

  const factory ApiResult.failure({required dynamic error}) = Failure<T>;
}

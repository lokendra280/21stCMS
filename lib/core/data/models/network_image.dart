import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_image.freezed.dart';

part 'network_image.g.dart';

@freezed
class NetworkImageModel with _$NetworkImageModel {
  const factory NetworkImageModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'key') String? key,
    @JsonKey(name: 'bucket') String? bucket,
  }) = _NetworkImageModel;

  factory NetworkImageModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkImageModelFromJson(json);
}

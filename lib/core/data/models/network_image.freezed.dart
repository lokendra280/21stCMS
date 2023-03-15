// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkImageModel _$NetworkImageModelFromJson(Map<String, dynamic> json) {
  return _NetworkImageModel.fromJson(json);
}

/// @nodoc
mixin _$NetworkImageModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'key')
  String? get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'bucket')
  String? get bucket => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkImageModelCopyWith<NetworkImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkImageModelCopyWith<$Res> {
  factory $NetworkImageModelCopyWith(
          NetworkImageModel value, $Res Function(NetworkImageModel) then) =
      _$NetworkImageModelCopyWithImpl<$Res, NetworkImageModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'key') String? key,
      @JsonKey(name: 'bucket') String? bucket});
}

/// @nodoc
class _$NetworkImageModelCopyWithImpl<$Res, $Val extends NetworkImageModel>
    implements $NetworkImageModelCopyWith<$Res> {
  _$NetworkImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? key = freezed,
    Object? bucket = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      bucket: freezed == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkImageModelCopyWith<$Res>
    implements $NetworkImageModelCopyWith<$Res> {
  factory _$$_NetworkImageModelCopyWith(_$_NetworkImageModel value,
          $Res Function(_$_NetworkImageModel) then) =
      __$$_NetworkImageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'key') String? key,
      @JsonKey(name: 'bucket') String? bucket});
}

/// @nodoc
class __$$_NetworkImageModelCopyWithImpl<$Res>
    extends _$NetworkImageModelCopyWithImpl<$Res, _$_NetworkImageModel>
    implements _$$_NetworkImageModelCopyWith<$Res> {
  __$$_NetworkImageModelCopyWithImpl(
      _$_NetworkImageModel _value, $Res Function(_$_NetworkImageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? key = freezed,
    Object? bucket = freezed,
  }) {
    return _then(_$_NetworkImageModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      bucket: freezed == bucket
          ? _value.bucket
          : bucket // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkImageModel implements _NetworkImageModel {
  const _$_NetworkImageModel(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'key') this.key,
      @JsonKey(name: 'bucket') this.bucket});

  factory _$_NetworkImageModel.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkImageModelFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'key')
  final String? key;
  @override
  @JsonKey(name: 'bucket')
  final String? bucket;

  @override
  String toString() {
    return 'NetworkImageModel(id: $id, url: $url, key: $key, bucket: $bucket)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkImageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.bucket, bucket) || other.bucket == bucket));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, url, key, bucket);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkImageModelCopyWith<_$_NetworkImageModel> get copyWith =>
      __$$_NetworkImageModelCopyWithImpl<_$_NetworkImageModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkImageModelToJson(
      this,
    );
  }
}

abstract class _NetworkImageModel implements NetworkImageModel {
  const factory _NetworkImageModel(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'key') final String? key,
      @JsonKey(name: 'bucket') final String? bucket}) = _$_NetworkImageModel;

  factory _NetworkImageModel.fromJson(Map<String, dynamic> json) =
      _$_NetworkImageModel.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'key')
  String? get key;
  @override
  @JsonKey(name: 'bucket')
  String? get bucket;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkImageModelCopyWith<_$_NetworkImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

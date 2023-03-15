// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) {
  return _ProfileInfo.fromJson(json);
}

/// @nodoc
mixin _$ProfileInfo {
  @JsonKey(name: "createdOn")
  DateTime? get createdOn => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "profileImage")
  NetworkImageModel? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "coverImage")
  NetworkImageModel? get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: "firstName")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "lastName")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "middleName")
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar")
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  dynamic get address => throw _privateConstructorUsedError;
  @JsonKey(name: "defaultTenant")
  int? get defaultTenant => throw _privateConstructorUsedError;
  @JsonKey(name: "user_role")
  List<String>? get userRole => throw _privateConstructorUsedError;
  @JsonKey(name: "isVendor")
  bool? get isVendor => throw _privateConstructorUsedError;
  @JsonKey(name: "isCustomer")
  bool? get isCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: "lastLogin")
  String? get lastLogin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileInfoCopyWith<ProfileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileInfoCopyWith<$Res> {
  factory $ProfileInfoCopyWith(
          ProfileInfo value, $Res Function(ProfileInfo) then) =
      _$ProfileInfoCopyWithImpl<$Res, ProfileInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "createdOn") DateTime? createdOn,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "profileImage") NetworkImageModel? profileImage,
      @JsonKey(name: "coverImage") NetworkImageModel? coverImage,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "middleName") String? middleName,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "avatar") String? avatar,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "defaultTenant") int? defaultTenant,
      @JsonKey(name: "user_role") List<String>? userRole,
      @JsonKey(name: "isVendor") bool? isVendor,
      @JsonKey(name: "isCustomer") bool? isCustomer,
      @JsonKey(name: "lastLogin") String? lastLogin});

  $NetworkImageModelCopyWith<$Res>? get profileImage;
  $NetworkImageModelCopyWith<$Res>? get coverImage;
}

/// @nodoc
class _$ProfileInfoCopyWithImpl<$Res, $Val extends ProfileInfo>
    implements $ProfileInfoCopyWith<$Res> {
  _$ProfileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdOn = freezed,
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? defaultTenant = freezed,
    Object? userRole = freezed,
    Object? isVendor = freezed,
    Object? isCustomer = freezed,
    Object? lastLogin = freezed,
  }) {
    return _then(_value.copyWith(
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as NetworkImageModel?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as NetworkImageModel?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      defaultTenant: freezed == defaultTenant
          ? _value.defaultTenant
          : defaultTenant // ignore: cast_nullable_to_non_nullable
              as int?,
      userRole: freezed == userRole
          ? _value.userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVendor: freezed == isVendor
          ? _value.isVendor
          : isVendor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomer: freezed == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkImageModelCopyWith<$Res>? get profileImage {
    if (_value.profileImage == null) {
      return null;
    }

    return $NetworkImageModelCopyWith<$Res>(_value.profileImage!, (value) {
      return _then(_value.copyWith(profileImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkImageModelCopyWith<$Res>? get coverImage {
    if (_value.coverImage == null) {
      return null;
    }

    return $NetworkImageModelCopyWith<$Res>(_value.coverImage!, (value) {
      return _then(_value.copyWith(coverImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileInfoCopyWith<$Res>
    implements $ProfileInfoCopyWith<$Res> {
  factory _$$_ProfileInfoCopyWith(
          _$_ProfileInfo value, $Res Function(_$_ProfileInfo) then) =
      __$$_ProfileInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "createdOn") DateTime? createdOn,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "profileImage") NetworkImageModel? profileImage,
      @JsonKey(name: "coverImage") NetworkImageModel? coverImage,
      @JsonKey(name: "firstName") String? firstName,
      @JsonKey(name: "lastName") String? lastName,
      @JsonKey(name: "middleName") String? middleName,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "avatar") String? avatar,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone") String? phone,
      @JsonKey(name: "address") dynamic address,
      @JsonKey(name: "defaultTenant") int? defaultTenant,
      @JsonKey(name: "user_role") List<String>? userRole,
      @JsonKey(name: "isVendor") bool? isVendor,
      @JsonKey(name: "isCustomer") bool? isCustomer,
      @JsonKey(name: "lastLogin") String? lastLogin});

  @override
  $NetworkImageModelCopyWith<$Res>? get profileImage;
  @override
  $NetworkImageModelCopyWith<$Res>? get coverImage;
}

/// @nodoc
class __$$_ProfileInfoCopyWithImpl<$Res>
    extends _$ProfileInfoCopyWithImpl<$Res, _$_ProfileInfo>
    implements _$$_ProfileInfoCopyWith<$Res> {
  __$$_ProfileInfoCopyWithImpl(
      _$_ProfileInfo _value, $Res Function(_$_ProfileInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdOn = freezed,
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? coverImage = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? defaultTenant = freezed,
    Object? userRole = freezed,
    Object? isVendor = freezed,
    Object? isCustomer = freezed,
    Object? lastLogin = freezed,
  }) {
    return _then(_$_ProfileInfo(
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as NetworkImageModel?,
      coverImage: freezed == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as NetworkImageModel?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
      defaultTenant: freezed == defaultTenant
          ? _value.defaultTenant
          : defaultTenant // ignore: cast_nullable_to_non_nullable
              as int?,
      userRole: freezed == userRole
          ? _value._userRole
          : userRole // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isVendor: freezed == isVendor
          ? _value.isVendor
          : isVendor // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomer: freezed == isCustomer
          ? _value.isCustomer
          : isCustomer // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastLogin: freezed == lastLogin
          ? _value.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileInfo implements _ProfileInfo {
  const _$_ProfileInfo(
      {@JsonKey(name: "createdOn") this.createdOn,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "profileImage") this.profileImage,
      @JsonKey(name: "coverImage") this.coverImage,
      @JsonKey(name: "firstName") this.firstName,
      @JsonKey(name: "lastName") this.lastName,
      @JsonKey(name: "middleName") this.middleName,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "avatar") this.avatar,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone") this.phone,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "defaultTenant") this.defaultTenant,
      @JsonKey(name: "user_role") final List<String>? userRole,
      @JsonKey(name: "isVendor") this.isVendor,
      @JsonKey(name: "isCustomer") this.isCustomer,
      @JsonKey(name: "lastLogin") this.lastLogin})
      : _userRole = userRole;

  factory _$_ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileInfoFromJson(json);

  @override
  @JsonKey(name: "createdOn")
  final DateTime? createdOn;
  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "profileImage")
  final NetworkImageModel? profileImage;
  @override
  @JsonKey(name: "coverImage")
  final NetworkImageModel? coverImage;
  @override
  @JsonKey(name: "firstName")
  final String? firstName;
  @override
  @JsonKey(name: "lastName")
  final String? lastName;
  @override
  @JsonKey(name: "middleName")
  final String? middleName;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "avatar")
  final String? avatar;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone")
  final String? phone;
  @override
  @JsonKey(name: "address")
  final dynamic address;
  @override
  @JsonKey(name: "defaultTenant")
  final int? defaultTenant;
  final List<String>? _userRole;
  @override
  @JsonKey(name: "user_role")
  List<String>? get userRole {
    final value = _userRole;
    if (value == null) return null;
    if (_userRole is EqualUnmodifiableListView) return _userRole;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "isVendor")
  final bool? isVendor;
  @override
  @JsonKey(name: "isCustomer")
  final bool? isCustomer;
  @override
  @JsonKey(name: "lastLogin")
  final String? lastLogin;

  @override
  String toString() {
    return 'ProfileInfo(createdOn: $createdOn, id: $id, profileImage: $profileImage, coverImage: $coverImage, firstName: $firstName, lastName: $lastName, middleName: $middleName, username: $username, avatar: $avatar, email: $email, phone: $phone, address: $address, defaultTenant: $defaultTenant, userRole: $userRole, isVendor: $isVendor, isCustomer: $isCustomer, lastLogin: $lastLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileInfo &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            (identical(other.defaultTenant, defaultTenant) ||
                other.defaultTenant == defaultTenant) &&
            const DeepCollectionEquality().equals(other._userRole, _userRole) &&
            (identical(other.isVendor, isVendor) ||
                other.isVendor == isVendor) &&
            (identical(other.isCustomer, isCustomer) ||
                other.isCustomer == isCustomer) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdOn,
      id,
      profileImage,
      coverImage,
      firstName,
      lastName,
      middleName,
      username,
      avatar,
      email,
      phone,
      const DeepCollectionEquality().hash(address),
      defaultTenant,
      const DeepCollectionEquality().hash(_userRole),
      isVendor,
      isCustomer,
      lastLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileInfoCopyWith<_$_ProfileInfo> get copyWith =>
      __$$_ProfileInfoCopyWithImpl<_$_ProfileInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileInfoToJson(
      this,
    );
  }
}

abstract class _ProfileInfo implements ProfileInfo {
  const factory _ProfileInfo(
      {@JsonKey(name: "createdOn") final DateTime? createdOn,
      @JsonKey(name: "id") final int? id,
      @JsonKey(name: "profileImage") final NetworkImageModel? profileImage,
      @JsonKey(name: "coverImage") final NetworkImageModel? coverImage,
      @JsonKey(name: "firstName") final String? firstName,
      @JsonKey(name: "lastName") final String? lastName,
      @JsonKey(name: "middleName") final String? middleName,
      @JsonKey(name: "username") final String? username,
      @JsonKey(name: "avatar") final String? avatar,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone") final String? phone,
      @JsonKey(name: "address") final dynamic address,
      @JsonKey(name: "defaultTenant") final int? defaultTenant,
      @JsonKey(name: "user_role") final List<String>? userRole,
      @JsonKey(name: "isVendor") final bool? isVendor,
      @JsonKey(name: "isCustomer") final bool? isCustomer,
      @JsonKey(name: "lastLogin") final String? lastLogin}) = _$_ProfileInfo;

  factory _ProfileInfo.fromJson(Map<String, dynamic> json) =
      _$_ProfileInfo.fromJson;

  @override
  @JsonKey(name: "createdOn")
  DateTime? get createdOn;
  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "profileImage")
  NetworkImageModel? get profileImage;
  @override
  @JsonKey(name: "coverImage")
  NetworkImageModel? get coverImage;
  @override
  @JsonKey(name: "firstName")
  String? get firstName;
  @override
  @JsonKey(name: "lastName")
  String? get lastName;
  @override
  @JsonKey(name: "middleName")
  String? get middleName;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "avatar")
  String? get avatar;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone")
  String? get phone;
  @override
  @JsonKey(name: "address")
  dynamic get address;
  @override
  @JsonKey(name: "defaultTenant")
  int? get defaultTenant;
  @override
  @JsonKey(name: "user_role")
  List<String>? get userRole;
  @override
  @JsonKey(name: "isVendor")
  bool? get isVendor;
  @override
  @JsonKey(name: "isCustomer")
  bool? get isCustomer;
  @override
  @JsonKey(name: "lastLogin")
  String? get lastLogin;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileInfoCopyWith<_$_ProfileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

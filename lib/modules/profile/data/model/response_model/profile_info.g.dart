// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileInfo _$$_ProfileInfoFromJson(Map<String, dynamic> json) =>
    _$_ProfileInfo(
      createdOn: json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      id: json['id'] as int?,
      profileImage: json['profileImage'] == null
          ? null
          : NetworkImageModel.fromJson(
              json['profileImage'] as Map<String, dynamic>),
      coverImage: json['coverImage'] == null
          ? null
          : NetworkImageModel.fromJson(
              json['coverImage'] as Map<String, dynamic>),
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      username: json['username'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'],
      defaultTenant: json['defaultTenant'] as int?,
      userRole: (json['user_role'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVendor: json['isVendor'] as bool?,
      isCustomer: json['isCustomer'] as bool?,
      lastLogin: json['lastLogin'] as String?,
    );

Map<String, dynamic> _$$_ProfileInfoToJson(_$_ProfileInfo instance) =>
    <String, dynamic>{
      'createdOn': instance.createdOn?.toIso8601String(),
      'id': instance.id,
      'profileImage': instance.profileImage,
      'coverImage': instance.coverImage,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'username': instance.username,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'defaultTenant': instance.defaultTenant,
      'user_role': instance.userRole,
      'isVendor': instance.isVendor,
      'isCustomer': instance.isCustomer,
      'lastLogin': instance.lastLogin,
    };

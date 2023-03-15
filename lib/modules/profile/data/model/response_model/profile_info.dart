import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/data/models/network_image.dart';

part 'profile_info.freezed.dart';

part 'profile_info.g.dart';

@freezed
class ProfileInfo with _$ProfileInfo {
  const factory ProfileInfo({
    @JsonKey(name: "createdOn") DateTime? createdOn,
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
    @JsonKey(name: "lastLogin") String? lastLogin,
  }) = _ProfileInfo;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$ProfileInfoFromJson(json);
}

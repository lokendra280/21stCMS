import 'dart:convert';

class ResponseParams {
  String? message;
  Data? data;

  ResponseParams({this.message, this.data});

  ResponseParams.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;
  String? expires;
  int? expiresIn;

  Data({this.token, this.user, this.expires, this.expiresIn});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    expires = json['expires'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['expires'] = this.expires;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}

class User {
  int? id;
  int? companyId;
  String? name;
  String? email;
  String? image;
  String? mobile;
  String? gender;
  String? locale;
  String? status;
  String? login;
  Null? onesignalPlayerId;
  String? createdAt;
  String? updatedAt;
  String? superAdmin;
  Null? emailVerificationCode;
  Null? socialToken;
  int? emailNotifications;
  int? countryId;
  Null? authorizeId;
  Null? authorizePaymentId;
  Null? cardBrand;
  Null? cardLastFour;
  String? lastLogin;
  String? imageUrl;
  List<String>? modules;
  String? userOtherRole;
  List<Roles>? roles;

  User({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.image,
    this.mobile,
    this.gender,
    this.locale,
    this.status,
    this.login,
    this.onesignalPlayerId,
    this.createdAt,
    this.updatedAt,
    this.superAdmin,
    this.emailVerificationCode,
    this.socialToken,
    this.emailNotifications,
    this.countryId,
    this.authorizeId,
    this.authorizePaymentId,
    this.cardBrand,
    this.cardLastFour,
    this.lastLogin,
    this.imageUrl,
    this.modules,
    this.userOtherRole,
    this.roles,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    mobile = json['mobile'];
    gender = json['gender'];
    locale = json['locale'];
    status = json['status'];
    login = json['login'];
    onesignalPlayerId = json['onesignal_player_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    superAdmin = json['super_admin'];
    emailVerificationCode = json['email_verification_code'];
    socialToken = json['social_token'];
    emailNotifications = json['email_notifications'];
    countryId = json['country_id'];
    authorizeId = json['authorize_id'];
    authorizePaymentId = json['authorize_payment_id'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    lastLogin = json['last_login'];
    imageUrl = json['image_url'];
    modules = json['modules'].cast<String>();
    userOtherRole = json['user_other_role'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['locale'] = this.locale;
    data['status'] = this.status;
    data['login'] = this.login;
    data['onesignal_player_id'] = this.onesignalPlayerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['super_admin'] = this.superAdmin;
    data['email_verification_code'] = this.emailVerificationCode;
    data['social_token'] = this.socialToken;
    data['email_notifications'] = this.emailNotifications;
    data['country_id'] = this.countryId;
    data['authorize_id'] = this.authorizeId;
    data['authorize_payment_id'] = this.authorizePaymentId;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['last_login'] = this.lastLogin;
    data['image_url'] = this.imageUrl;
    data['modules'] = this.modules;
    data['user_other_role'] = this.userOtherRole;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Roles {
  int? id;
  int? companyId;
  String? name;
  String? displayName;
  String? description;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Roles({
    this.id,
    this.companyId,
    this.name,
    this.displayName,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'name': name,
      'displayName': displayName,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      id: map['id'] != null ? map['id'] as int : null,
      companyId: map['companyId'] != null ? map['companyId'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) =>
      Roles.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pivot {
  int? userId;
  int? roleId;

  Pivot({this.userId, this.roleId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    return data;
  }
}

class ProfileUpdateReqParams {
  ProfileUpdateReqParams({
    this.name,
    this.email,
    this.image,
    this.mobile,
    this.gender,
    this.locale,
    this.login,
  });
  String? name;
  String? email;
  String? image;
  String? mobile;
  String? gender;
  String? locale;
  String? status;
  String? login;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    if (image != null) map['image'] = image;
    if (mobile != null) map['mobile'] = mobile;
    if (gender != null) map['gender'] = gender;
    if (locale != null) map['phone'] = locale;
    if (status != null) map['address'] = status;
    if (login != null) map['address'] = login;

    return map;
  }
}

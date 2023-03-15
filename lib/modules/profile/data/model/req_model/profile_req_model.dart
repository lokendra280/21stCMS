class ProfileUpdateReqParams {
  ProfileUpdateReqParams({
    this.firstName,
    this.lastName,
    this.middleName,
    this.avatar,
    this.email,
    this.phone,
    this.address,
  });
  String? firstName;
  String? lastName;
  String? middleName;
  String? avatar;
  String? email;
  String? phone;
  String? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    if(middleName!=null) map['middleName'] = middleName;
   if(avatar!=null) map['avatar'] = avatar;
    if(email!=null)    map['email'] = email;
    if(phone!=null)   map['phone'] = phone;
    if(address!=null)  map['address'] = address;
    return map;
  }
}
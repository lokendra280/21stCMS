

class RegistrationParams {
  String? clientId;
  String? clientSecret;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? fullName;
  String? phone;
  String? device;
  String? otpKey;

  RegistrationParams({
    this.clientId,
    this.clientSecret,
    this.username,
    // this.firstName,
    this.phone,
    this.device,
    this.otpKey,
    this.fullName,
    this.password,
    this.email,
    this.confirmPassword,
    // this.lastName
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;
    map['otpKey'] = otpKey;
    return map;
  }

}
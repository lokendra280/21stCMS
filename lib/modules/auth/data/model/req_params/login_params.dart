class LoginParams {

  String? email;
  String? password;

  LoginParams({
  
    this.email,
    this.password,
  });

  Map<String, dynamic> toJsonLogin(){
    final map = <String, dynamic>{};

    map["email"] = email;
    map["password"] = password;
    return map;
  }
}


class SocialLoginParams{
  String? accessToken;
  String? type;

  SocialLoginParams({
    this.accessToken,
    this.type,
});

  Map<String, dynamic> toJson(){
    final map = <String, dynamic>{};
    map["loginType"] = type??"facebook";
    map["accessToken"] = accessToken;
    return map;
  }
}

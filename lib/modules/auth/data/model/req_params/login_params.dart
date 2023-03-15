class LoginParams {
  String? clientId;
  String? clientSecret;
  String? username;
  String? password;

  LoginParams({
    this.clientId,
    this.clientSecret,
    this.username,
    this.password,
  });

  Map<String, dynamic> toJsonLogin(){
    final map = <String, dynamic>{};
    map["client_id"] = clientId;
    map["client_secret"] = clientSecret;
    map["username"] = username;
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

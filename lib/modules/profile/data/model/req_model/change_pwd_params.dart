class ChangePasswordParams {
  String? oldPassword;
  String? code;
  String? newPassword;
  String? confirmPassword;

  ChangePasswordParams({this.oldPassword, this.code, this.newPassword,this.confirmPassword});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["code"] = 'PASSWORD_CHANGED';
    map["password"] = newPassword;
    map["confirmPassword"] = confirmPassword;
    map["oldPassword"] = oldPassword;
    return map;
  }
}

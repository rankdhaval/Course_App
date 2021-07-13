class LoginModel {
  String email;
  String password;
  String deviceToken;
  String deviceType;
  String categoryId;

  LoginModel(
      {this.email,
        this.password,
        this.deviceToken,
        this.deviceType,
        this.categoryId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['category_id'] = this.categoryId;
    return data;
  }
}

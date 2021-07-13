class SignUpModel {
  String firstName;
  String lastName;
  String passwordConfirmation;
  String email;
  String password;
  String deviceToken;
  String deviceType;
  String categoryId;

  SignUpModel(
      {this.firstName,
        this.lastName,
        this.passwordConfirmation,
        this.email,
        this.password,
        this.deviceToken,
        this.deviceType,
        this.categoryId});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    passwordConfirmation = json['password_confirmation'];
    email = json['email'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['password_confirmation'] = this.passwordConfirmation;
    data['email'] = this.email;
    data['password'] = this.password;
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['category_id'] = this.categoryId;
    return data;
  }
}

class LoginRequestModel{
   String? email;
   String? password;

  LoginRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };

}
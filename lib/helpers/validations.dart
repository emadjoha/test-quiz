import 'package:email_validator/email_validator.dart';

class Validations {

  static String emailValidation(String email) {
    if(email.isEmpty) return "This Field is Required";
    else if (EmailValidator.validate(email)==false){
      return "email address not correct";
    }
    return "";
  }
  static String passwordValidation(String password){
    if(password.isEmpty) return "This Field is Required";
    return "";
  }


}
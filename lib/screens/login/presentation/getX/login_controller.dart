import 'package:authentication/core/enums/login_enum.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';

abstract class LoginController {

  void startLoading();
  void endLoading();
  void showError(String value);

  void basicLogin(String? email, String? password);
  void googleLogin();
  void signInFetchedSuccess(LoginResponseModel loginResponseModel);
  void signInFetchedGoogleSuccess(response);

}
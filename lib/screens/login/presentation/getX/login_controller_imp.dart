import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:authentication/screens/login/domain/usecase/basic_login_usecase.dart';
import 'package:authentication/screens/login/domain/usecase/google_login_usecase.dart';
import 'package:authentication/screens/login/presentation/getX/login_controller.dart';
import 'package:authentication/screens/login/presentation/getX/login_state.dart';
import 'package:get/get.dart';

class LoginControllerImp extends GetxController implements LoginController {
  InitialState loginState = InitialState();
  final _basicLoginUseCase = BasicLoginUseCase();
  final _googleLoginUseCase = GoogleLoginUseCase();

  @override
  void endLoading() {
    loginState.isLoading = false;
  }

  @override
  Future<void> basicLogin(String? email, String? password) async {
    var result;
    startLoading();
    result = await _basicLoginUseCase(
        BasicLoginUseCaseParams(email: email!, password: password!));

    result.fold((error) async {
      endLoading();
      showError("Somethings went worng");
    }, (successData) async {
      if (successData.status == Status.COMPLETED) {
        endLoading();
        signInFetchedSuccess(successData.data);
      } else {
        endLoading();
        showError(successData.message);
      }
    });
  }

  @override
  void showError(String value) {
    loginState.error = value;
    update();
  }

  @override
  void signInFetchedSuccess(LoginResponseModel loginResponseModel) {
    //TODO  Save access token in local storage..
    loginState.loginSuccess = true;
    loginState.loginResponseModel = loginResponseModel;
    update();
  }

  @override
  void startLoading() {
    loginState.isLoading = true;
    update();
  }

  @override
  Future<void> googleLogin() async {
    var result = await _googleLoginUseCase(GoogleLoginUseCaseParams());
    result.fold((error) async {
      showError("Somethings went worng");
    }, (successData) async {
      if (successData.status == Status.COMPLETED) {
        final authentication = await  successData.data!.authentication;
        signInFetchedGoogleSuccess(authentication.accessToken);
      } else {
        showError(successData.message!);
      }
    });
  }

  @override
  void signInFetchedGoogleSuccess(clientId) {
    //TODO  Save clientID in local storage..
    loginState.loginSuccess = true;
    update();
  }
}

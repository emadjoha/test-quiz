import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/data_source/google_login_provider/google_login_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class  GoogleLoginProviderImp implements GoogleLoginProvider{
  late ApiResponse<GoogleSignInAccount> _loginResponse;
  ApiResponse<GoogleSignInAccount> get loginResponseModel => _loginResponse;
  set loginResponseModel(ApiResponse<GoogleSignInAccount> value) {
    _loginResponse = value;
  }

  @override
  Future<ApiResponse<GoogleSignInAccount>> loginWithGoogle() async {
    var response;
    try {
      response = await GoogleSignIn().signIn();

      loginResponseModel = ApiResponse.completed(response);

    }catch(error){
        loginResponseModel = ApiResponse.error("somethings went worng");
    }

    return loginResponseModel;
  }

}
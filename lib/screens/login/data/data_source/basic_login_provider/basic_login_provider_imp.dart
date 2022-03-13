import 'package:authentication/core/urls_constant.dart';
import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/helpers/base_provider.dart';
import 'package:authentication/helpers/exception_handler.dart';
import 'package:authentication/screens/login/data/data_source/basic_login_provider/basic_login_provider.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:dio/dio.dart';

class BasicLoginProviderImp extends BaseProvider implements BasicLoginProvider{
  static String loginUrl ='/api/login';

  late ApiResponse<LoginResponseModel> _loginResponse;
  ApiResponse<LoginResponseModel> get loginResponseModel => _loginResponse;
  set loginResponseModel(ApiResponse<LoginResponseModel> value) {
    _loginResponse = value;
  }

  @override
  Future<ApiResponse<LoginResponseModel>> login({required String email, required String password}) async {
    var response;

    try {
      var data = {
        "email":email,
        "password":password,
      };

      response = await client.post(Urls.baseUrl + loginUrl, options: getHeadersWithoutToken(), data: data);

      loginResponseModel = ApiResponse.completed(LoginResponseModel.fromJson(response.data));

    }catch(error){
      try {
        error is  DioError? customExceptionHandler(error,1):customExceptionHandler(error,response);
      } catch (forcedException ) {
        loginResponseModel = ApiResponse.error(forcedException.toString());
      }
    }
    return loginResponseModel;
  }

}
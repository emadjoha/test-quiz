import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';

abstract class BasicLoginProvider{
  Future<ApiResponse<LoginResponseModel>> login({required String email ,required String password});
}
import 'package:authentication/screens/login/data/model/login_response_model.dart';

class InitialState {
   bool isLoading = false;
   bool loginSuccess = false;
   String error = "";
   LoginResponseModel? loginResponseModel;
}
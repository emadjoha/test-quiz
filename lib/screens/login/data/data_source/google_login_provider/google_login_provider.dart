import 'package:authentication/helpers/api_response.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleLoginProvider{
  Future<ApiResponse<GoogleSignInAccount>> loginWithGoogle();

}
import 'package:authentication/core/failures.dart';
import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginRepository {
  // Google authentication
  Future<Either<Failure,ApiResponse<GoogleSignInAccount>>> loginWithGoogle() ;
  // basic authentication
  Future<Either<Failure,ApiResponse<LoginResponseModel>>> login({required String email, required String password});
}
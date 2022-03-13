import 'package:authentication/core/failures.dart';
import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/data_source/basic_login_provider/basic_login_provider_imp.dart';
import 'package:authentication/screens/login/data/data_source/google_login_provider/google_login_provider_imp.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:authentication/screens/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepositoryImp implements LoginRepository{
  final _basicLoginProvider = BasicLoginProviderImp();
  final _googleLoginProvider = GoogleLoginProviderImp();

  @override
  Future<Either<Failure, ApiResponse<LoginResponseModel>>> login({required String email, required String password}) async {
    var result;
    try {
      result = await _basicLoginProvider.login(email:email,password:password);
      return Right(result);
    } catch (e) {
      return Left(result);
    }
  }

  @override
  Future<Either<Failure, ApiResponse<GoogleSignInAccount>>> loginWithGoogle() async {
    var result;
    try {
      result = await _googleLoginProvider.loginWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(result);
    }
  }


}

import 'package:authentication/core/failures.dart';
import 'package:authentication/core/use_case.dart';
import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:authentication/screens/login/data/repository/login_repository_imp.dart';
import 'package:authentication/screens/login/domain/repository/login_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginUseCase extends UseCase<ApiResponse<GoogleSignInAccount>, GoogleLoginUseCaseParams> {
  LoginRepository  _loginRepositoryImp = LoginRepositoryImp();

  GoogleLoginUseCase();

  @override
  Future<Either<Failure, ApiResponse<GoogleSignInAccount>>> call(GoogleLoginUseCaseParams params) {
    return _loginRepositoryImp.loginWithGoogle();
  }

}

class GoogleLoginUseCaseParams {
  GoogleLoginUseCaseParams();
}

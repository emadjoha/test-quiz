import 'package:authentication/core/failures.dart';
import 'package:authentication/core/use_case.dart';
import 'package:authentication/helpers/api_response.dart';
import 'package:authentication/screens/login/data/model/login_response_model.dart';
import 'package:authentication/screens/login/data/repository/login_repository_imp.dart';
import 'package:dartz/dartz.dart';

class BasicLoginUseCase extends UseCase<ApiResponse<LoginResponseModel>, BasicLoginUseCaseParams> {
  LoginRepositoryImp  _loginRepositoryImp = LoginRepositoryImp();

  BasicLoginUseCase();

  @override
  Future<Either<Failure, ApiResponse<LoginResponseModel>>> call(BasicLoginUseCaseParams params) {
    return _loginRepositoryImp.login(email: params.email, password: params.password);
  }

}

class BasicLoginUseCaseParams {
  final String email;
  final String password;
  BasicLoginUseCaseParams({required this.email,required this.password});
}

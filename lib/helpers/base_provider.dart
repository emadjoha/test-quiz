
import 'package:authentication/helpers/singleton_instances.dart';
import 'package:dio/dio.dart';

class BaseProvider {

  Dio client = getIt<Dio>();

  getHeadersWithoutToken(){
    Options options = Options(
      headers: {
        "Content-Type": "application/json",
      },
    );
    return options;
  }

}
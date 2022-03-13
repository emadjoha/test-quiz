
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Dio dio = Dio();
initSingletonInstances(){
  getIt.registerSingleton<Dio>(dio);
}
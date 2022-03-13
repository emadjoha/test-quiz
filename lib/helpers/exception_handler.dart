import 'package:authentication/helpers/app_exceptions.dart';
import 'package:dio/dio.dart';

dynamic  customExceptionHandler<T>(dioError,response) {
  switch(response) {
    case 1:
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.sendTimeout:
          throw NoInternetConnectionException('No Internet Connection');
        case DioErrorType.response:
          throw NotFoundException(dioError.response.data['error']);
        default:
          throw DefaultException('Somethings error ');
      }
    default:
      switch (response) {
        case 404:
          throw NotFoundException('Request Not Found');
        default:
          throw DefaultException(response['error']);
      }
  }
}
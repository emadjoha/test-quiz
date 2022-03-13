class AppException implements Exception {
  final _message;

  AppException([this._message]);

  String toString() {
    return "$_message";
  }
}



class NotFoundException extends AppException {
  NotFoundException([message]):super(message);
}

class DefaultException extends AppException {
  DefaultException([message]):super(message);
}

class ConnectionTimeoutException extends AppException {
  ConnectionTimeoutException([String? message]) : super(message);
}
class NoInternetConnectionException extends AppException {
  NoInternetConnectionException([String? message]) : super(message);
}
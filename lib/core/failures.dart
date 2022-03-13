import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  int error;
  Failure(this.error);
  @override
  List<Object?> get props => throw UnimplementedError();
}
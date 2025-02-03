part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccess extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
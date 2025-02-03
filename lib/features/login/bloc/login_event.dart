part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String user_name;
  final String password;

  LoginButtonPressed({required this.user_name, required this.password});

  @override
  List<Object> get props => [user_name, password];
}
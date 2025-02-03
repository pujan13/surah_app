import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../core/api/api_client.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final url = Uri.parse(ApiConfig.AUTHENTICATE_API);
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'user_name': event.user_name, 'password': event.password}),
      );
      print(response.body);
      if (response.body == '"Authenticated successfully"') {
          emit(LoginSuccess());
        } else {
        emit(LoginFailure(error: 'Invalid credentials'));
      }
    } catch (e) {
      emit(LoginFailure(error: 'Something went wrong'));
    }
  }
}

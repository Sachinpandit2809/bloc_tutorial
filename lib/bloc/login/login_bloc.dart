import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on(_onEmailChange);
    on(_onPasswordChange);
    on(_onLoginApi);
  }
  void _onEmailChange(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginApi(LoginApi event, Emitter emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    Map data = {'email': state.email, 'password': state.password};
    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: data,
      );
      final Map<String, dynamic> res = json.decode(response.body);

      if (response.statusCode == 200) {
        // if(res.containsKey('token')){
        //   emit(state.copyWith(status: LoginStatus.success, message: 'Login Success'));
        // }else{
        //   emit(state.copyWith(status: LoginStatus.error, message: res['error']));
        // }
        emit(state.copyWith(
            status: LoginStatus.success, message: 'Login Success'));
      } else {
        emit(state.copyWith(status: LoginStatus.error, message: res['error']));
      }
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, message: e.toString()));
    }
  }
}

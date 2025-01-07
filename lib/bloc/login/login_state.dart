part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String email;
  final String password;
  final String message;
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.message = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [status, email, password, message];
}



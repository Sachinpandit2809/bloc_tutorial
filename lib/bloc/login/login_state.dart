part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String email;
  final String password;
  final String message;
  final bool loading;
  const LoginState({
    this.status = LoginStatus.initial,
    this.loading = false,
    this.email = '',
    this.password = '',
    this.message = '',
  });

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    bool ? loading,
    String? password,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [status, email, password, message, loading];
}

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;
  const EmailChanged({required this.email});
  List<Object> get props => [email];
}

class PasswordChange extends LoginEvent{
  final String password;
  const PasswordChange({required this.password});
  List<Object> get props => [password]; 
}

class LoginApi extends LoginEvent{

}
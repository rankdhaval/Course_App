part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable{}

class SignInEvent extends LoginEvent{
  final LoginModel loginModel;

  SignInEvent(this.loginModel);
  @override
  List<Object> get props => [];
}

class SignUpEvent extends LoginEvent{
  final SignUpModel signUpModel;

  SignUpEvent(this.signUpModel);
  @override
  List<Object> get props => [];
}
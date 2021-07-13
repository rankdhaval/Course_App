part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];

}

class LoginErrorState extends LoginState {
  final String errorMessage;

  LoginErrorState({this.errorMessage});

  @override
  List<Object> get props => [];

}

class LoginSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

class SignUpSuccessState extends LoginState {
  @override
  List<Object> get props => [];
}

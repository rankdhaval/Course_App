import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:zignut_practicle/model/login_model.dart';
import 'package:zignut_practicle/model/sign_up_model.dart';
import 'package:zignut_practicle/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository repository;
  LoginBloc({this.repository}) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent) {
      yield await repository.loginUser(loginModel: event.loginModel);
    } else if (event is SignUpEvent) {
      yield await repository.signUpUser(signUpModel: event.signUpModel);
    }
  }
}

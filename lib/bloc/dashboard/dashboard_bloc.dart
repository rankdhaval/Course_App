import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zignut_practicle/model/dashboard_response_model.dart';
import 'package:zignut_practicle/model/dashhboard_request_parameter_model.dart';
import 'package:zignut_practicle/repository/login_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final LoginRepository repository;
  DashboardBloc({this.repository}) : super(DashboardInitialState());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    if(event is GetCourseDataEvent){
      yield DashboardLoadingState();
      yield await repository.customerCourseList(event.dashboardParameterModel);
    }
  }
}

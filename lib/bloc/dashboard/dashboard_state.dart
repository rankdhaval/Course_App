part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitialState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadedState extends DashboardState {
  final DashboardResponseModel dashboardResponseModel;

  DashboardLoadedState(this.dashboardResponseModel);
  @override
  List<Object> get props => [];
}

class DashboardErrorState extends DashboardState {
  final String errorMessage;

  DashboardErrorState({this.errorMessage});
  @override
  List<Object> get props => [];
}

part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class GetCourseDataEvent extends DashboardEvent{
  final DashboardParameterModel dashboardParameterModel;

  GetCourseDataEvent(this.dashboardParameterModel);
  @override
  List<Object> get props => [];
}
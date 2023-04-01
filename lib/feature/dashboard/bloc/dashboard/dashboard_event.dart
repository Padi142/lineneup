part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class Initial extends DashboardEvent {
  const Initial();
}

class OpenEventCreation extends DashboardEvent {
  const OpenEventCreation();
}

class OpenEventDetail extends DashboardEvent {
  final String eventId;
  const OpenEventDetail({required this.eventId});
}

part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class Initial extends DashboardEvent {
  const Initial();
}

class EventCreation extends DashboardEvent {
  const EventCreation();
}

class PickAndUploadFile extends DashboardEvent {
  final String eventUid;
  const PickAndUploadFile({required this.eventUid});
}

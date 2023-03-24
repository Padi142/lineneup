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

class UploadEventCover extends DashboardEvent {
  final String eventUid;
  const UploadEventCover({required this.eventUid});
}

class UploadArtistPhoto extends DashboardEvent {
  final String artistUid;
  const UploadArtistPhoto({required this.artistUid});
}

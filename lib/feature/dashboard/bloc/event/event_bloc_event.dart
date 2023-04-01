part of 'event_bloc.dart';

abstract class EventBlocEvent extends Equatable {
  const EventBlocEvent();

  @override
  List<Object> get props => [];
}

class EventInitial extends EventBlocEvent {
  const EventInitial();
}

class UploadEventCover extends EventBlocEvent {
  final String eventUid;
  const UploadEventCover({required this.eventUid});
}

class UploadArtistPhoto extends EventBlocEvent {
  final String artistUid;
  const UploadArtistPhoto({required this.artistUid});
}

class LoadEventInfo extends EventBlocEvent {
  final String? eventId;
  const LoadEventInfo({required this.eventId});
}

class UpdateEvent extends EventBlocEvent {
  final UpdateType type;
  final String eventId;
  final String? name;
  final String? description;
  final DateTime? startDate;
  final DateTime? endTime;
  final String? ticketsUrl;
  final String? eventInstagram;
  final String? eventWebsite;
  const UpdateEvent({required this.type, required this.eventId, this.name, this.description, this.startDate, this.endTime, this.ticketsUrl, this.eventInstagram, this.eventWebsite});
}

class CreateEvent extends EventBlocEvent {
  final String eventName;
  final String description;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final DateTime startDate;
  final DateTime endDate;
  final List<ArtistCreationModel> artists;
  const CreateEvent({required this.eventName, required this.description, required this.startTime, required this.startDate, required this.endTime, required this.endDate, required this.artists});
}

enum UpdateType {
  eventName,
  startTime,
  endTime,
  description,
  eventInstagram,
  eventWebsite,
  ticketsUrl,
}

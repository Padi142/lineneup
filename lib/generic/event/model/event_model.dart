import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final int id;
  final DateTime createdAt;
  final String eventName;
  final String eventLogo;
  final DateTime startTime;
  final DateTime endTime;
  final String ticketsUrl;
  final String eventUid;
  final String description;

  const EventModel(
      {required this.id,
      required this.createdAt,
      required this.eventName,
      required this.eventLogo,
      required this.startTime,
      required this.description,
      required this.endTime,
      required this.eventUid,
      required this.ticketsUrl});

  @override
  List<Object?> get props => [id, createdAt, eventName, eventLogo, startTime, description, endTime, eventUid, ticketsUrl];
}

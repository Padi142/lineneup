part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object> get props => [];
}

class CreateEvent extends EventEvent {
  final String name;
  final DateTime start;
  final DateTime end;
  const CreateEvent(this.name, this.start, this.end);

  @override
  List<Object> get props => [];
}

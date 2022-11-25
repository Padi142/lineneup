part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvents extends UserEvent {
  final String uid;
  const GetUserEvents(this.uid);

  @override
  List<Object> get props => [];
}

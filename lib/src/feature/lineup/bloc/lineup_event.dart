part of 'lineup_bloc.dart';

abstract class LineupEvent extends Equatable {
  const LineupEvent();

  @override
  List<Object> get props => [];
}

class GetLineup extends LineupEvent {
  final String uid;
  const GetLineup(this.uid);

  @override
  List<Object> get props => [];
}

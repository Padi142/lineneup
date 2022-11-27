part of 'lineup_bloc.dart';

abstract class LineupEvent extends Equatable {
  const LineupEvent();

  @override
  List<Object> get props => [];
}

class GetLineup extends LineupEvent {
  final String uid;
  final BuildContext context;
  const GetLineup(this.uid, this.context);

  @override
  List<Object> get props => [];
}

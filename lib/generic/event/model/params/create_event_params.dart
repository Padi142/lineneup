import 'package:equatable/equatable.dart';

class CreateEventParams extends Equatable {
  final String eventName;
  final String creatorUid;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  const CreateEventParams({required this.eventName, required this.creatorUid, required this.description, required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [];
}

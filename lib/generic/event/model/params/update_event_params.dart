import 'package:equatable/equatable.dart';

class UpdateEventParams extends Equatable {
  final String eventUid;
  final String type;
  final String? eventName;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? ticketsUrl;
  final String? eventInstagram;
  final String? eventWebsite;

  const UpdateEventParams({
    required this.eventUid,
    required this.type,
    this.eventName,
    this.description,
    this.startDate,
    this.endDate,
    this.ticketsUrl,
    this.eventInstagram,
    this.eventWebsite,
  });

  @override
  List<Object?> get props => [];
}

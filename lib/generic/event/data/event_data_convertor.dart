import 'package:lineneup/generic/event/model/event_data_dto.dart';

import '../model/event_model.dart';

extension EventDataConvertor on EventDataDto {
  EventModel toDomain() {
    return EventModel(id: id, eventName: eventName, createdAt: createdAt, startTime: startTime, endTime: endTime, description: description, eventLogo: eventLogo, ticketsUrl: ticketsUrl, eventUid: eventUid);
  }
}

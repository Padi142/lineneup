import 'package:dio/dio.dart';
import 'package:lineneup/generic/event/model/event_data_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'event_api.g.dart';

@RestApi()
abstract class EventApi {
  factory EventApi(Dio dio) = _EventApi;

  @GET(
    '/event?uid={id}',
  )
  Future<EventDataDto> getEvent(
    @Path() String id,
  );
}

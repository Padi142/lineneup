import 'package:dio/dio.dart';
import 'package:lineneup/generic/event/model/event_data_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../event/model/results/event_creation_result.dart';

part 'event_api.g.dart';

@RestApi()
abstract class EventApi {
  factory EventApi(Dio dio) = _EventApi;

  @GET(
    '/event?uid={uid}',
  )
  Future<EventDataDto> getEvent(
    @Path() String uid,
  );

  @GET(
    '/user_events?uid={uid}',
  )
  Future<EventListDataDto> getUserEvents(
    @Path() String uid,
  );

  @GET(
    '/update_event?uid={uid}&type={type}&name={name}&startTime={startTime}&endTime={endTime}&description={description}',
  )
  Future<String> updateEvent(
    @Path() String uid,
    @Path() String type,
    @Path() String? name,
    @Path() String? startTime,
    @Path() String? endTime,
    @Path() String? description,
  );

  @POST(
    '/create_event',
  )
  @MultiPart()
  Future<EventCreateResult> createEvent(
    @Part(name: 'event_name') String event_name,
    @Part(name: 'creator_uid') String creator_uid,
    @Part(name: 'start_time') String start_time,
    @Part(name: 'end_time') String end_time,
    @Part(name: 'description') String description,
  );

  // @POST(
  //   '/event_upload?uid={uid}',
  // )
  // Future<EventCoverUploadApiResponse> artistPhotoUpload(
  //   @Path() String uid,
  //   @Part(name: 'file') File file,
  // );
}

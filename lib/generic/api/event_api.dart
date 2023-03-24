import 'package:dio/dio.dart';
import 'package:lineneup/generic/event/model/event_data_dto.dart';
import 'package:retrofit/retrofit.dart';

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

  // @POST(
  //   '/event_upload?uid={uid}',
  // )
  // Future<EventCoverUploadApiResponse> artistPhotoUpload(
  //   @Path() String uid,
  //   @Part(name: 'file') File file,
  // );
}

import 'package:dio/dio.dart';
import 'package:lineneup/src/shared/models/event_model.dart';

class UserProvider {
  String url = "https://lineapbackend-production.up.railway.app/";
  Future<List<EventModel>?> getUserEvents(String uid) async {
    Dio dio = Dio();
    final result = await dio.get("${url}user_events?uid=$uid");
    if (result.statusCode == 200) {
      return (result.data as List<dynamic>)
          .map((it) => EventModel.fromJson(it))
          .toList();
    } else {
      return null;
    }
  }
}

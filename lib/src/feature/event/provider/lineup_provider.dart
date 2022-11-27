import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class EventProvider {
  String url = "https://lineapbackend-production.up.railway.app/";
  Future<bool> createEvent(
      String eventName, String creatorUid, DateTime start, DateTime end) async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    dio.options.queryParameters.addAll({
      "event_name": eventName,
      "creator_uid": creatorUid,
      "start_time": start.toString(),
      "end_time": end.toString()
    });
    try {
      final result = await dio
          .get("https://lineapbackend-production.up.railway.app/create_event");
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}

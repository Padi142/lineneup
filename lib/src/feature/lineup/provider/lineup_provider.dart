import 'package:dio/dio.dart';
import 'package:lineneup/src/shared/models/artist_model.dart';

class LineupProvider {
  String url = "https://lineapbackend-production.up.railway.app/";
  Future<List<ArtistModel>?> getLineup(String uid) async {
    Dio dio = Dio();
    final result = await dio.get("${url}artists?uid=$uid");
    if (result.statusCode == 200) {
      return (result.data as List<dynamic>)
          .map((it) => ArtistModel.fromJson(it))
          .toList();
    } else {
      return null;
    }
  }
}

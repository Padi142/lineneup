import 'package:lineneup/src/core/models/artist_model.dart';
import 'package:lineneup/src/core/models/lineup_model.dart';

class LineupProvider {
  Future<LineupModel> getLineup() async {
    return LineupModel(artists: [
      ArtistModel(
          artistName: "Bob Kubert",
          photo:
              "https://media.discordapp.net/attachments/989639754393993276/1042903195753660416/image.png",
          start: DateTime(
            2002,
            1,
            1,
            21,
          ),
          end: DateTime(
            2002,
            1,
            1,
            22,
          )),
      ArtistModel(
          artistName: "Granko Škwára",
          photo:
              "https://media.discordapp.net/attachments/989639754393993276/1044036297469218886/image.png",
          start: DateTime(
            2002,
            1,
            1,
            22,
          ),
          end: DateTime(
            2002,
            1,
            1,
            23,
          )),
      ArtistModel(
          artistName: "Litterbin",
          photo:
              "https://media.discordapp.net/attachments/989639754393993276/1044036297804742696/image.png",
          start: DateTime(
            2002,
            1,
            1,
            23,
          ),
          end: DateTime(
            2002,
            1,
            2,
            0,
          )),
      ArtistModel(
          artistName: "Dj Ketak",
          photo:
              "https://media.discordapp.net/attachments/989639754393993276/1044036298123518043/image.png",
          start: DateTime(
            2002,
            1,
            1,
            0,
          ),
          end: DateTime(
            2002,
            1,
            1,
            2,
          )),
    ]);
  }
}

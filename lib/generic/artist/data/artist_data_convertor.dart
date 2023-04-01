import 'package:lineneup/generic/artist/model/artist_data_dto.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';

extension ArtistDataConvertor on ArtistDataDto {
  ArtistModel toDomain() {
    return ArtistModel(
        id: id,
        artistName: artistName,
        createdAt: createdAt,
        startTime: startTime,
        endTime: endTime,
        artistDescription: artistDescription,
        artistPhoto: artistPhoto,
        artistUid: artistUid,
        eventId: eventId,
        appleLink: appleLink,
        spotifyLink: spotifyLink,
        instagramLink: instagramLink);
  }
}

import 'package:lineneup/generic/artist/model/artist_data_dto.dart';
import 'package:lineneup/generic/artist/model/artist_model.dart';

import '../model/spotify_artist_search.dart';
import '../model/spotify_artist_search_dto.dart';

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

extension SpotifyArtistListConvertor on SpotifyArtistListDto {
  SpotifyArtistList toDomain() {
    return SpotifyArtistList(artists: artists.map((it) => it.toDomain()).toList());
  }
}

extension SpotifyArtistDataConvertor on SpotifyArtistDataDto {
  SpotifyArtistData toDomain() {
    return SpotifyArtistData(
      name: name,
      photos: photos.map((it) => it.toDomain()).toList(),
      url: url,
    );
  }
}

extension SpotifyArtisPhotoConvertor on SpotifyArtisPhotoDto {
  SpotifyArtisPhoto toDomain() {
    return SpotifyArtisPhoto(
      height: height,
      width: width,
      url: url,
    );
  }
}

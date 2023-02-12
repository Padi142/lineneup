import 'package:equatable/equatable.dart';

class ArtistModel extends Equatable {
  final int id;
  final String eventId;
  final DateTime createdAt;
  final String artistName;
  final String artistPhoto;
  final String startTime;
  final String endTime;
  final String artistUid;
  final String artistDescription;
  final String spotifyLink;
  final String appleLink;
  final String instagramLink;

  const ArtistModel(
      {required this.id,
      required this.eventId,
      required this.artistName,
      required this.artistPhoto,
      required this.createdAt,
      required this.startTime,
      required this.artistUid,
      required this.endTime,
      required this.artistDescription,
      required this.appleLink,
      required this.instagramLink,
      required this.spotifyLink});

  @override
  List<Object?> get props => [
        id,
        createdAt,
        eventId,
        artistName,
        startTime,
        artistPhoto,
        endTime,
        createdAt,
        artistUid,
        artistDescription,
        instagramLink,
        appleLink,
        spotifyLink,
      ];
}

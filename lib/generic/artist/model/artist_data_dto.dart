import 'package:json_annotation/json_annotation.dart';

part 'artist_data_dto.g.dart';

@JsonSerializable()
class ArtistListDto {
  final List<ArtistDataDto> artists;

  const ArtistListDto({
    required this.artists,
  });

  factory ArtistListDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistListDtoToJson(this);
}

@JsonSerializable()
class ArtistDataDto {
  final int id;
  @JsonKey(name: 'event_id')
  final String eventId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'artist_name')
  final String artistName;
  @JsonKey(name: 'artist_photo')
  final String artistPhoto;
  @JsonKey(name: 'start_time')
  final String startTime;
  @JsonKey(name: 'end_time')
  final String endTime;
  @JsonKey(name: 'artist_uid')
  final String artistUid;
  @JsonKey(name: 'artist_description')
  final String artistDescription;
  @JsonKey(name: 'spotify_link')
  final String spotifyLink;
  @JsonKey(name: 'apple_link')
  final String appleLink;
  @JsonKey(name: 'instagram_link')
  final String instagramLink;

  const ArtistDataDto(
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

  factory ArtistDataDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistDataDtoToJson(this);
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "artist_model.g.dart";

@JsonSerializable()
class ArtistModel extends Equatable {
  @JsonKey(name: "Artist_name")
  final String artistName;
  @JsonKey(name: "Artist_photo")
  final String artistPhoto;
  @JsonKey(name: "Artist_uid")
  final String artistUid;
  @JsonKey(name: "Event")
  final int eventId;
  @JsonKey(name: "Start_time")
  final DateTime startTime;
  @JsonKey(name: "End_time")
  final DateTime endTime;

  const ArtistModel({
    required this.artistName,
    required this.artistPhoto,
    required this.artistUid,
    required this.eventId,
    required this.startTime,
    required this.endTime,
  });

  @override
  List<Object?> get props => [artistName, artistPhoto, artistUid];

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}

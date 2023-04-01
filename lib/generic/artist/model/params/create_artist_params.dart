import 'package:equatable/equatable.dart';

class CreateArtistParams extends Equatable {
  final String artistName;
  final String eventUid;
  final String description;
  final DateTime startTime;
  final DateTime endTime;
  final String spotifyUrl;
  final String instagramUrl;
  final String appleUrl;
  final String image;
  const CreateArtistParams({
    required this.artistName,
    required this.eventUid,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.spotifyUrl,
    required this.instagramUrl,
    required this.appleUrl,
    required this.image,
  });

  @override
  List<Object?> get props => [];
}

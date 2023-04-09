part of 'artist_bloc.dart';

abstract class ArtistEvent extends Equatable {
  const ArtistEvent();

  @override
  List<Object> get props => [];
}

class LoadArtists extends ArtistEvent {
  final String? eventId;
  const LoadArtists({required this.eventId});
}

class SearchArtistSpotify extends ArtistEvent {
  final String name;
  const SearchArtistSpotify({required this.name});
}

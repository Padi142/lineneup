import 'package:equatable/equatable.dart';

class SearchSpotifyArtistParams extends Equatable {
  final String artistName;

  const SearchSpotifyArtistParams({required this.artistName});

  @override
  List<Object?> get props => [];
}

class SpotifyArtistList {
  final List<SpotifyArtistData> artists;

  const SpotifyArtistList({
    required this.artists,
  });
}

class SpotifyArtistData {
  final String name;
  final List<SpotifyArtisPhoto> photos;
  final String url;

  const SpotifyArtistData({
    required this.name,
    required this.photos,
    required this.url,
  });
}

class SpotifyArtisPhoto {
  final double height;
  final double width;
  final String url;

  const SpotifyArtisPhoto({
    required this.height,
    required this.width,
    required this.url,
  });
}

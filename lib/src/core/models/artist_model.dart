import 'package:equatable/equatable.dart';

class ArtistModel extends Equatable {
  final String artistName;
  final String photo;
  final DateTime start;
  final DateTime end;

  const ArtistModel({
    required this.artistName,
    required this.photo,
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [artistName, start, end];
}

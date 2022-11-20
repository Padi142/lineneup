import 'package:equatable/equatable.dart';
import 'package:lineneup/src/core/models/artist_model.dart';

class LineupModel extends Equatable {
  final List<ArtistModel> artists;

  const LineupModel({
    required this.artists,
  });

  @override
  List<Object?> get props => [artists];
}

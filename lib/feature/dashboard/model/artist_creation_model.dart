import 'package:equatable/equatable.dart';

class ArtistCreationModel extends Equatable {
  final String name;
  final String instagramUrl;

  const ArtistCreationModel({required this.name, required this.instagramUrl});

  @override
  List<Object?> get props => [];
}

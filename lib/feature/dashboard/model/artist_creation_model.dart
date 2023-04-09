import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ArtistCreationModel extends Equatable {
  final String name;
  final String? instagramUrl;
  final String? spotifyUrl;
  final String? spotifyImage;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  const ArtistCreationModel({required this.name, required this.instagramUrl, required this.spotifyImage, required this.spotifyUrl, required this.startTime, required this.endTime});

  @override
  List<Object?> get props => [];
}

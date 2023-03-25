import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ArtistCreationModel extends Equatable {
  final String name;
  final String instagramUrl;
  final TimeOfDay time;

  const ArtistCreationModel({required this.name, required this.instagramUrl, required this.time});

  @override
  List<Object?> get props => [];
}

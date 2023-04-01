import 'dart:io';

import 'package:equatable/equatable.dart';

class UploadArtistPhotoParams extends Equatable {
  final String uid;
  final File file;

  const UploadArtistPhotoParams({required this.file, required this.uid});

  @override
  List<Object?> get props => [];
}

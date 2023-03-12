import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class UploadArtistPhotoParams extends Equatable {
  final String uid;
  final PlatformFile file;

  const UploadArtistPhotoParams({required this.file, required this.uid});

  @override
  List<Object?> get props => [];
}

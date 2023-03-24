import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UploadEventCoverParams extends Equatable {
  final String uid;
  final MultipartFile file;

  const UploadEventCoverParams({required this.file, required this.uid});

  @override
  List<Object?> get props => [];
}

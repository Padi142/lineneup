import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String displayName;
  final String email;
  final String uid;

  const UserModel({
    required this.displayName,
    required this.email,
    required this.uid,
  });

  @override
  List<Object?> get props => [displayName, email, uid];
}

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String picture;
  final bool isAnonymously;

  const UserEntity(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone,
      required this.picture,
      required this.isAnonymously});

  @override
  List<Object?> get props => [uid, name, email, phone, picture, isAnonymously];
}

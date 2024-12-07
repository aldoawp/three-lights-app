import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final bool isAnonymously;

  const User(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone,
      required this.isAnonymously});

  @override
  List<Object?> get props => [uid, name, email, phone, isAnonymously];
}

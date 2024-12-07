import 'package:tlb_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.uid,
      required super.name,
      required super.email,
      required super.phone,
      required super.isAnonymously});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'] as String,
      name: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      isAnonymously: json['is_anonymous'] as bool,
    );
  }
}

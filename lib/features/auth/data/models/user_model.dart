import 'package:tlb_app/core/common/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid,
      required super.name,
      required super.email,
      required super.phone,
      required super.isAnonymously});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'] as String,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      isAnonymously: json['is_anonymous'] as bool,
    );
  }
}

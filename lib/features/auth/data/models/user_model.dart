import 'package:tlb_app/core/common/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid,
      required super.name,
      required super.email,
      required super.phone,
      required super.picture,
      required super.isAnonymously});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'] as String,
      name: json['user_metadata']['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      picture: json['user_metadata']['picture'] as String? ?? '',
      isAnonymously: json['is_anonymous'] as bool,
    );
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? picture,
    bool? isAnonymously,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      picture: picture ?? this.picture,
      isAnonymously: isAnonymously ?? this.isAnonymously,
    );
  }
}

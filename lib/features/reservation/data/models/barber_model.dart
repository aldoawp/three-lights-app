import 'package:tlb_app/features/reservation/domain/entities/barber.dart';

class BarberModel extends Barber {
  const BarberModel({
    required super.barberId,
    required super.firstName,
    required super.lastName,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      barberId: json['barber_id'] ?? 0,
      firstName: json['first_name'] ?? 0,
      lastName: json['last_name'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'barber_id': barberId,
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  static BarberModel empty() {
    return const BarberModel(
      barberId: 0,
      firstName: '',
      lastName: '',
    );
  }
}

import 'package:tlb_app/features/reservation/domain/entities/avaible_hour.dart';

class AvaibleHourModel extends AvaibleHour {
  const AvaibleHourModel({
    required super.hourId,
    required super.hour,
    super.status,
  });

  factory AvaibleHourModel.fromJson(Map<String, dynamic> json) {
    return AvaibleHourModel(
      hourId: json['hour_id'] ?? 0,
      hour: json['hour'] ?? '',
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hour_id': hourId,
      'hour': hour,
      'status': status,
    };
  }

  static AvaibleHourModel empty() {
    return const AvaibleHourModel(
      hourId: 0,
      hour: '',
      status: '',
    );
  }
}

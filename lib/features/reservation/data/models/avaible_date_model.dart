import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';

class AvaibleDateModel extends AvaibleDate {
  const AvaibleDateModel({
    required super.dateId,
    required super.date,
  });
  factory AvaibleDateModel.fromJson(Map<String, dynamic> json) {
    return AvaibleDateModel(
      dateId: json['date_id'] ?? 0,
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date_id': dateId,
      'date': date,
    };
  }

  static AvaibleDateModel empty() {
    return const AvaibleDateModel(
      dateId: 0,
      date: '',
    );
  }
}

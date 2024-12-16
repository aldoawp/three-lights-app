import 'package:tlb_app/features/reservation/data/models/avaible_date_model.dart';
import 'package:tlb_app/features/reservation/data/models/avaible_hour_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/booking.dart';

import 'service_model.dart';
import 'barber_model.dart';

class BookingModel extends Booking {
  const BookingModel({
    required super.services,
    required super.barbers,
    required super.avaibleDates,
    required super.avaibleHours,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      services: (json['services'] as List)
          .map((serviceJson) => ServiceModel.fromJson(serviceJson))
          .toList(),
      barbers: (json['barbers'] as List)
          .map((barberJson) => BarberModel.fromJson(barberJson))
          .toList(),
      avaibleDates: (json['availableDates'] as List)
          .map((dateJson) => AvaibleDateModel.fromJson(dateJson))
          .toList(),
      avaibleHours: (json['availableHours'] as List)
          .map((hourJson) => AvaibleHourModel.fromJson(hourJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'services': services
          .map((service) => (service as ServiceModel).toJson())
          .toList(),
      'barbers':
          barbers.map((barber) => (barber as BarberModel).toJson()).toList(),
      'availablDates': avaibleDates
          .map((date) => (date as AvaibleDateModel).toJson())
          .toList(),
      'availableHours': avaibleHours
          .map((hour) => (hour as AvaibleHourModel).toJson())
          .toList(),
    };
  }

  Booking toDomain() => Booking(
        services: services,
        barbers: barbers,
        avaibleDates: avaibleDates,
        avaibleHours: avaibleHours,
      );
}

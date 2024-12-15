import 'package:tlb_app/features/reservation/data/models/avaible_date_model.dart';
import 'package:tlb_app/features/reservation/data/models/avaible_hour_model.dart';
import 'package:tlb_app/features/reservation/data/models/barber_model.dart';
import 'package:tlb_app/features/reservation/data/models/service_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  const ReservationModel({
    required super.reservationId,
    required super.userId,
    required super.paymentMethod,
    required super.totalPayment,
    required super.status,
    required ServiceModel super.service,
    required AvaibleDateModel super.date,
    required AvaibleHourModel super.hour,
    required BarberModel super.barber,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['reservation_id'] ?? 0,
      userId: json['user_id'] ?? '',
      service: json['services'] != null
          ? ServiceModel.fromJson(json['services'])
          : ServiceModel.empty(),
      date: json['available_dates'] != null
          ? AvaibleDateModel.fromJson(json['available_dates'])
          : AvaibleDateModel.empty(),
      hour: json['available_hours'] != null
          ? AvaibleHourModel.fromJson(json['available_hours'])
          : AvaibleHourModel.empty(),
      barber: json['barbers'] != null
          ? BarberModel.fromJson(json['barbers'])
          : BarberModel.empty(),
      paymentMethod: json['payment_method'] ?? '',
      totalPayment: json['total_payment'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservation_id': reservationId,
      'user_id': userId,
      'payment_method': paymentMethod,
      'total_payment': totalPayment,
      'status': status,
      'services': (service as ServiceModel).toJson(),
      'available_dates': (date as AvaibleDateModel).toJson(),
      'available_hours': (hour as AvaibleHourModel).toJson(),
      'barbers': (barber as BarberModel).toJson(),
    };
  }

  // Convert ReservationModel to Reservation (Domain Layer)
  Reservation toDomain() {
    return Reservation(
      reservationId: reservationId,
      userId: userId,
      paymentMethod: paymentMethod,
      totalPayment: totalPayment,
      status: status,
      service: service,
      date: date,
      hour: hour,
      barber: barber,
    );
  }

  // Convert Reservation (Domain Layer) to ReservationModel
  factory ReservationModel.fromDomain(Reservation reservation) {
    return ReservationModel(
      reservationId: reservation.reservationId,
      userId: reservation.userId,
      paymentMethod: reservation.paymentMethod,
      totalPayment: reservation.totalPayment,
      status: reservation.status,
      service: reservation.service as ServiceModel,
      date: reservation.date as AvaibleDateModel,
      hour: reservation.hour as AvaibleHourModel,
      barber: reservation.barber as BarberModel,
    );
  }
}

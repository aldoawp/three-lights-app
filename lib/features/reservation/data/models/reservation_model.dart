import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  const ReservationModel({
    required super.reservationId,
    required super.userId,
    required super.serviceName,
    required super.servicePrice,
    required super.dateId,
    required super.dateData,
    required super.hourId,
    required super.hourData,
    required super.barberFirstName,
    required super.barberLastName,
    required super.paymentMethod,
    required super.totalpayment,
    required super.status,
    required super.serviceId,
    required super.barberId,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['reservation_id'] ?? 0,
      userId: json['user_id'] ?? '',
      serviceId: json['services']['service_id'] ?? 0,
      serviceName: json['services']['name'] ?? '',
      servicePrice: json['services']['price'] ?? 0,
      dateId: json['available_dates']['date_id'] ?? 0,
      dateData: json['available_dates']['date'] ?? '',
      hourId: json['available_hours']['hour_id'] ?? 0,
      hourData: json['available_hours']['hour'] ?? '',
      barberId: json['barbers']['barber_id'] ?? 0,
      barberFirstName: json['barbers']['first_name'] ?? '',
      barberLastName: json['barbers']['last_name'] ?? '',
      paymentMethod: json['payment_method'] ?? '',
      totalpayment: json['total_payment'] ?? 0,
      status: json['status'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservation_id': reservationId,
      'user_id': userId,
      'services': {
        'name': serviceName,
        'price': servicePrice,
      },
      'available_dates': {
        'date_id': dateId,
        'date': dateData,
      },
      'available_hours': {
        'hour_id': hourId,
        'hour': hourData,
      },
      'barbers': {
        'first_name': barberFirstName,
        'last_name': barberLastName,
      },
      'payment_method': paymentMethod,
      'total_payment': totalpayment,
      'status': status,
    };
  }
}

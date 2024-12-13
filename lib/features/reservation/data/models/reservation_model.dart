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

class ServiceModel {
  final int id;
  final String name;
  final int price;

  ServiceModel({
    required this.id,
    required this.name,
    required this.price,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['service_id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
    );
  }
}

class BarberModel {
  final int id;
  final String firstName;
  final String lastName;

  BarberModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      id: json['barber_id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
    );
  }
}

class AvailableDateModel {
  final int id;
  final String date;

  AvailableDateModel({
    required this.id,
    required this.date,
  });

  factory AvailableDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableDateModel(
      id: json['date_id'] ?? 0,
      date: json['date'] ?? '',
    );
  }
}

class AvailableHourModel {
  final int id;
  final String hour;

  AvailableHourModel({
    required this.id,
    required this.hour,
  });

  factory AvailableHourModel.fromJson(Map<String, dynamic> json) {
    return AvailableHourModel(
      id: json['hour_id'] ?? 0,
      hour: json['hour'] ?? '',
    );
  }
}

import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  final int reservationId;
  final String userId;
  final int serviceId;
  final String serviceName;
  final int servicePrice;
  final int dateId;
  final String dateData;
  final int hourId;
  final String hourData;
  final int barberId;
  final String barberFirstName;
  final String barberLastName;
  final String paymentMethod;
  final int totalpayment;
  final String status;

  const Reservation({
    required this.reservationId,
    required this.userId,
    required this.serviceId,
    required this.serviceName,
    required this.servicePrice,
    required this.dateId,
    required this.dateData,
    required this.hourId,
    required this.hourData,
    required this.barberId,
    required this.barberFirstName,
    required this.barberLastName,
    required this.paymentMethod,
    required this.totalpayment,
    required this.status,
  });

  @override
  List<Object?> get props => [
        reservationId,
        userId,
        serviceId,
        serviceName,
        servicePrice,
        dateId,
        dateData,
        hourId,
        hourData,
        barberId,
        barberFirstName,
        barberLastName,
        paymentMethod,
        totalpayment,
        status,
      ];
}

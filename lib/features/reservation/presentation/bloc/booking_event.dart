import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_hour.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart';

abstract class BookingEvent {}

class FetchBookingData extends BookingEvent {}

class SelectBarber extends BookingEvent {
  final Barber barber;

  SelectBarber({required this.barber});
}

class SelectDate extends BookingEvent {
  final AvaibleDate date;

  SelectDate({required this.date});
}

class SelectTime extends BookingEvent {
  final AvaibleHour time;

  SelectTime({required this.time});
}

class SelectService extends BookingEvent {
  final Service service;

  SelectService({required this.service});
}

class CreateReservation extends BookingEvent {
  final Map<String, dynamic> reservationData;

  CreateReservation({required this.reservationData});
}

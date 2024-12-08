import 'package:equatable/equatable.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

abstract class ReservationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadUserDataEvents extends ReservationEvent {}

class LoadReservationHistoryEvents extends ReservationEvent {
  final String userId;

  LoadReservationHistoryEvents(this.userId);

  @override
  List<Object> get props => [userId];
}

class CreateReservationEvents extends ReservationEvent {
  final Reservation reservation;

  CreateReservationEvents(this.reservation);

  @override
  List<Object> get props => [reservation];
}

class CancelReservationEvents extends ReservationEvent {
  final int reservationId;

  CancelReservationEvents(this.reservationId);

  @override
  List<Object> get props => [reservationId];
}

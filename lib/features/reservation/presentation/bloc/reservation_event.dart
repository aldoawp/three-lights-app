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

class LoadReservationHistory extends ReservationEvent {
  final String userId;

  LoadReservationHistory({required this.userId});
}

class CancelReservationEvent extends ReservationEvent {
  final int reservationId;

  CancelReservationEvent({required this.reservationId});
}

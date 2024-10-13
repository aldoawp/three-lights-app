part of 'reservations_bloc.dart';

abstract class ReservationsEvent extends Equatable {
  const ReservationsEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserDataEvents extends ReservationsEvent {}

final class LoadReservationHistoryEvent extends ReservationsEvent {}

final class CheckCurrentReservationEvent extends ReservationsEvent {}


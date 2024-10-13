part of 'reservation_bloc.dart';

abstract class ReservationEvent extends Equatable {
  const ReservationEvent();

  @override
  List<Object> get props => [];
}

final class LoadUserDataEvents extends ReservationEvent {}

final class LoadReservationHistoryEvent extends ReservationEvent {}

final class CheckCurrentReservationEvent extends ReservationEvent {}

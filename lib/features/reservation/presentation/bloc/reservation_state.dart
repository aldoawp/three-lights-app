import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/data/models/reservation_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

abstract class ReservationState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReservationInitialState extends ReservationState {}

class ReservationLoadingState extends ReservationState {}

class ReservationFailureState extends ReservationState {
  final String message;

  ReservationFailureState(this.message);

  @override
  List<Object> get props => [message];
}

class ReservationLoadedState extends ReservationState {
  final List<Reservation> reservations;

  ReservationLoadedState({required this.reservations});
}

class ReservationCreated extends ReservationState {}

class ReservationCancelled extends ReservationState {}

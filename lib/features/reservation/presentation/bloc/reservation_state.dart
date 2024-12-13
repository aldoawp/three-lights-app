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
  final List<Reservation> history;
  final List<Reservation> ongoing;
  final List<Reservation> completed;
  final List<Reservation> canceled;

  ReservationLoadedState({
    required this.history,
    required this.ongoing,
    required this.completed,
    required this.canceled,
  });

  @override
  List<Object> get props => [history, ongoing, completed, canceled];
}

class BookingPageInitialState extends ReservationState {}

class BookingPageLoadingState extends ReservationState {}

class BookingPageFailureState extends ReservationState {
  final String message;

  BookingPageFailureState(this.message);

  @override
  List<Object> get props => [message];
}

class BookingPageLoadedState extends ReservationState {
  final List<ServiceModel> services;
  final List<BarberModel> barbers;
  final List<AvailableDateModel> availableDates;
  final List<AvailableHourModel> availableHours;

  BookingPageLoadedState({
    required this.services,
    required this.barbers,
    required this.availableDates,
    required this.availableHours,
  });

  @override
  List<Object> get props => [services, barbers, availableDates, availableHours];
}

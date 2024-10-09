part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  const ReservationState();  

  @override
  List<Object> get props => [];
}
class ReservationInitial extends ReservationState {}

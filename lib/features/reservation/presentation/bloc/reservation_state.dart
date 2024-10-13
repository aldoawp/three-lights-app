part of 'reservation_bloc.dart';

abstract class ReservationState extends Equatable {
  final String userName;
  final String userImageURL;

  const ReservationState({required this.userName, required this.userImageURL});

  @override
  List<Object> get props => [];
}

class ReservationInitial extends ReservationState {
  const ReservationInitial(
      {required super.userName, required super.userImageURL});
}

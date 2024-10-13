part of 'reservations_bloc.dart';

abstract class ReservationsState extends Equatable {
  final String userName;
  final String userImageURL;

  const ReservationsState({required this.userName, required this.userImageURL});

  @override
  List<Object> get props => [];
}

class ReservationsInitial extends ReservationsState {
  const ReservationsInitial(
      {required super.userName, required super.userImageURL});
}

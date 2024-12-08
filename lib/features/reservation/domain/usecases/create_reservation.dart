import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class CreateReservation {
  final ReservationRepository repository;

  CreateReservation(this.repository);

  Future<void> execute(Reservation reservation) {
    return repository.createReservation(reservation);
  }
}

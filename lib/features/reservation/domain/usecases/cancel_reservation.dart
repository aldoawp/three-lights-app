import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class CancelReservation {
  final ReservationRepository repository;

  CancelReservation(this.repository);

  Future<void> execute(int reservationId) {
    return repository.cancelReservation(reservationId);
  }
}

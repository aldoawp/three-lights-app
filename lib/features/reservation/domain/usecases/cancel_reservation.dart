import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class CancelReservation {
  final ReservationRepository reservationRepository;

  CancelReservation(this.reservationRepository);

  Future<void> execute(int reservationId) async {
    await reservationRepository.cancelReservation(reservationId);
  }
}

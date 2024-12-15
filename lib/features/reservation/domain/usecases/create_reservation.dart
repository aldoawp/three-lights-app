import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class CreateReservation {
  final ReservationRepository reservationRepository;

  CreateReservation(this.reservationRepository);

  Future<void> execute(Reservation reservation) async {
    await reservationRepository.createReservation(reservation);
  }
}

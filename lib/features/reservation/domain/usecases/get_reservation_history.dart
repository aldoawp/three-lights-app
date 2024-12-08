import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservationHistory {
  final ReservationRepository repository;

  GetReservationHistory(this.repository);

  Future<List<Reservation>> execute(String userId) {
    return repository.getReservationHistory(userId);
  }
}

import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservationHistory {
  final ReservationRepository reservationRepository;

  GetReservationHistory({required this.reservationRepository});

  Future<List<Reservation>> execute(String userId) async {
    return await reservationRepository.getReservationHistory(userId);
  }
}

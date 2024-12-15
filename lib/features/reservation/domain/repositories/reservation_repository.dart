import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservationHistory(String userId);
  Future<void> createReservation(Reservation reservation);
  Future<void> cancelReservation(int reservationId);
}

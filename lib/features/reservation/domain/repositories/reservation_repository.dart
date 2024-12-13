import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';

abstract class ReservationRepository {
  Future<void> createReservation(Reservation data);

  Future<void> cancelReservation(int reservationId);

  Future<List<Reservation>> getReservationHistory(String userId);

  Future<Either<Failure, Map<String, dynamic>>> getReservationOptions();
}

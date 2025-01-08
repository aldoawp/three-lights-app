import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';

class CreateReservationUseCase {
  final BookingRepository repositoy;

  CreateReservationUseCase(this.repositoy);

  Future<void> call(Map<String, dynamic> reservationData) async {
    try {
      await repositoy.createReservation(reservationData);
    } catch (e) {
      throw Exception('Failed to create reservation: $e');
    }
  }
}

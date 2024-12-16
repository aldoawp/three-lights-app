import 'package:tlb_app/features/reservation/domain/entities/booking.dart';

abstract class BookingRepository {
  Future<Booking> fetchBookingData();
  Future<void> createReservation(Map<String, dynamic> reservationData);
}

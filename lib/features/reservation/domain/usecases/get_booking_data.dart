import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/reservation/domain/entities/booking.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';

class FetchBookingDataUseCase {
  final BookingRepository repository;

  FetchBookingDataUseCase(this.repository);

  Future<Booking> call() async {
    return await repository.fetchBookingData();
  }
}

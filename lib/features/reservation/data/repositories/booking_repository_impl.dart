import 'package:tlb_app/features/reservation/data/datasources/booking_remote_datasource.dart';
import 'package:tlb_app/features/reservation/domain/entities/booking.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDatasource remoteDataSource;
  String? paymentToken;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Booking> fetchBookingData() async {
    try {
      final bookingModel = await remoteDataSource.fetchBookingData();
      return bookingModel.toDomain();
    } catch (error) {
      throw Exception('Error in BookingRepositoryImpl: $error');
    }
  }

  @override
  Future<void> createReservation(Map<String, dynamic> reservationData) async {
    try {
      await remoteDataSource.createReservation(reservationData);
    } catch (error) {
      throw Exception('Error Creating Reservation $error');
    }
  }

  @override
  String? get getPaymentToken => paymentToken;

  @override
  void savePaymentToken(String token) {
    paymentToken = token;
  }
}

import 'package:tlb_app/features/reservation/data/datasources/reservation_remote_datasource.dart';
import 'package:tlb_app/features/reservation/data/models/reservation_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDatasource remoteDataSource;

  ReservationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Reservation>> getReservationHistory(String userId) async {
    final reservationModels =
        await remoteDataSource.fetchReservationHistory(userId);
    return reservationModels.map((model) => model.toDomain()).toList();
  }

  @override
  Future<void> cancelReservation(int reservationId) async {
    try {
      await remoteDataSource.cancelReservation(reservationId);
    } catch (error) {
      throw Exception('Error creating reservation: $error');
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:tlb_app/features/reservation/data/datasources/reservation_remote_datasource.dart';
// import 'package:tlb_app/features/reservation/data/models/reservation_model.dart';

// class ReservationRemoteDatasourceImpl implements ReservationRemoteDatasource {
//   final Dio client;

//   ReservationRemoteDatasourceImpl({required this.client});

//   @override
//   Future<void> createReservation(ReservationModel reservation) async {
//     final response =
//         await client.post('/api/reservations', data: reservation.toJson());

//     if (response.statusCode != 200) {
//       throw Exception('Failed to create reservation. Please try again later.');
//     }
//   }

//   @override
//   Future<void> cancelReservation(int reservationId) async {
//     final response = await client.post('/api/reservations/$reservationId');

//     if (response.statusCode != 200) {
//       throw Exception('Failed to cancel reservation. Please try again later.');
//     }
//   }

//   @override
//   Future<List<ReservationModel>> fetchReservationHistory(String userId) async {
//     final response = await client.get(
//       '/reservation-data/$userId',
//     );
//     if (response.statusCode == 200) {
//       return (response.data as List)
//           .map((json) => ReservationModel.fromJson(json))
//           .toList();
//     } else {
//       throw Exception(
//           'Failed to get reservation history : ${response.statusCode}');
//     }
//   }
// }

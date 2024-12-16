// import 'package:dio/dio.dart';
// import 'package:tlb_app/features/reservation/data/datasources/booking_remote_datasource.dart';
// import 'package:tlb_app/features/reservation/data/repositories/booking_repository_impl.dart';

// void main() async {
//   // final dio = Dio(BaseOptions(baseUrl: 'http://localhost:3000/api'));
//   final dataSource = BookingRemoteDatasourceImpl(client: dio);
//   final repository = BookingRepositoryImpl(remoteDataSource: dataSource);

//   try {
//     await repository.createReservation({
//       "user_id": "106cf300-b256-4c08-b44c-5a4d9e308edf",
//       "service_id": 2,
//       "barber_id": 3,
//       "date_id": 6,
//       "hour_id": 5
//     });
//     print("Reservation created successfully!");
//   } catch (e) {
//     print("Error: $e");
//   }
// }

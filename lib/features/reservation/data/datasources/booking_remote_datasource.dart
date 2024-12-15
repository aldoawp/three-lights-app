import 'package:dio/dio.dart';
import 'package:tlb_app/features/reservation/data/models/booking_model.dart';

abstract class BookingRemoteDatasource {
  Future<BookingModel> fetchBookingData();
  Future<void> createReservation(Map<String, dynamic> data);
}

class BookingRemoteDatasourceImpl implements BookingRemoteDatasource {
  final Dio client;

  BookingRemoteDatasourceImpl({required this.client});

  @override
  Future<BookingModel> fetchBookingData() async {
    final response = await client.get('/reservation-service');
    if (response.statusCode == 200) {
      // No need to cast to List; directly parse the JSON object
      return BookingModel.fromJson(response.data as Map<String, dynamic>);
    } else {
      throw Exception('Failed to fetch booking data: ${response.statusCode}');
    }
  }

  @override
  Future<void> createReservation(Map<String, dynamic> data) async {
    final response = await client.post('/reservation', data: data);
    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception('Failed to create reservation : ${response.statusCode}');
    }
  }
}

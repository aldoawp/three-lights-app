import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tlb_app/core/error/exceptions.dart';
import 'package:tlb_app/core/error/failures.dart';
import 'package:tlb_app/features/reservation/data/datasources/reservation_remote_datasource.dart';
import 'package:tlb_app/features/reservation/data/models/reservation_model.dart';
import 'package:tlb_app/features/reservation/domain/entities/reservation.dart';
import 'package:tlb_app/features/reservation/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDatasource remoteDatasource;

  ReservationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<void> createReservation(Reservation reservation) async {
    try {
      final reservationModel = ReservationModel(
        reservationId: reservation.reservationId,
        userId: reservation.userId,
        serviceId: reservation.serviceId,
        serviceName: reservation.serviceName,
        servicePrice: reservation.servicePrice,
        dateId: reservation.dateId,
        dateData: reservation.dateData,
        hourId: reservation.hourId,
        hourData: reservation.hourData,
        barberId: reservation.barberId,
        barberFirstName: reservation.barberFirstName,
        barberLastName: reservation.barberLastName,
        paymentMethod: reservation.paymentMethod,
        totalpayment: reservation.totalpayment,
        status: reservation.status,
      );
      await remoteDatasource.createReservation(reservationModel);
    } catch (e) {
      debugPrint(('Error creating reservation: $e'));
      rethrow;
    }
  }

  @override
  Future<void> cancelReservation(int reservationId) async {
    try {
      await remoteDatasource.cancelReservation(reservationId);
    } catch (e) {
      debugPrint(('Error canceling reservation: $e'));
      rethrow;
    }
  }

  @override
  Future<List<Reservation>> getReservationHistory(String userId) async {
    try {
      final models = await remoteDatasource.getReservationHistory(userId);
      // Pastikan ini mengembalikan list of domain entities, bukan model
      return models
          .map((model) => Reservation(
                reservationId: model.reservationId,
                userId: model.userId,
                serviceId: model.serviceId,
                serviceName: model.serviceName,
                servicePrice: model.servicePrice,
                dateId: model.dateId,
                dateData: model.dateData,
                hourId: model.hourId,
                hourData: model.hourData,
                barberId: model.barberId,
                barberFirstName: model.barberFirstName,
                barberLastName: model.barberLastName,
                paymentMethod: model.paymentMethod,
                totalpayment: model.totalpayment,
                status: model.status,
              ))
          .toList();
    } catch (e) {
      debugPrint('Error getting reservation history: $e');
      rethrow;
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getReservationOptions() async {
    try {
      final result = await remoteDatasource.getReservationOption();
      return Right(result);
    } catch (e) {
      debugPrint('Error getting reservation history: $e');
      rethrow;
    }
  }
}

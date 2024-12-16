import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_hour.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart'
    as services;

class Reservation extends Equatable {
  final int reservationId;
  final String userId;
  final String paymentMethod;
  final int totalPayment;
  final String status;
  final services.Service service;
  final AvaibleDate date;
  final AvaibleHour hour;
  final Barber barber;

  const Reservation({
    required this.reservationId,
    required this.userId,
    required this.paymentMethod,
    required this.totalPayment,
    required this.status,
    required this.service,
    required this.date,
    required this.hour,
    required this.barber,
  });

  @override
  List<Object?> get props => [
        reservationId,
        userId,
        paymentMethod,
        totalPayment,
        status,
        service,
        date,
        hour,
        barber
      ];
}

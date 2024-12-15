import 'package:equatable/equatable.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_hour.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart';

class Booking extends Equatable {
  final List<Service> services;
  final List<Barber> barbers;
  final List<AvaibleDate> avaibleDates;
  final List<AvaibleHour> avaibleHours;

  const Booking({
    required this.services,
    required this.barbers,
    required this.avaibleDates,
    required this.avaibleHours,
  });
  @override
  List<Object?> get props => [services, barbers, avaibleDates, avaibleHours];
}

import 'package:tlb_app/features/reservation/domain/entities/avaible_date.dart';
import 'package:tlb_app/features/reservation/domain/entities/avaible_hour.dart';
import 'package:tlb_app/features/reservation/domain/entities/barber.dart';
import 'package:tlb_app/features/reservation/domain/entities/booking.dart';
import 'package:tlb_app/features/reservation/domain/entities/service.dart';

abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  final Booking booking;
  final Barber? selectedBarber;
  final AvaibleDate? selectedDate;
  final AvaibleHour? selectedTime;
  final Service? selectedService;

  BookingLoaded({
    required this.booking,
    this.selectedBarber,
    this.selectedDate,
    this.selectedTime,
    this.selectedService,
  });

  BookingLoaded copyWith({
    Barber? selectedBarber,
    AvaibleDate? selectedDate,
    AvaibleHour? selectedTime,
    Service? selectedService,
  }) {
    return BookingLoaded(
      booking: booking,
      selectedBarber: selectedBarber ?? this.selectedBarber,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedService: selectedService ?? this.selectedService,
    );
  }
}

class BookingError extends BookingState {
  final String message;

  BookingError({required this.message});
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/domain/repositories/booking_repository.dart';
import 'package:tlb_app/features/reservation/domain/usecases/get_booking_data.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final FetchBookingDataUseCase fetchBookingDataUseCase;
  final BookingRepository repository;

  BookingBloc({required this.fetchBookingDataUseCase, required this.repository})
      : super(BookingInitial()) {
    on<FetchBookingData>((event, emit) async {
      emit(BookingLoading());
      try {
        final booking = await fetchBookingDataUseCase();
        emit(BookingLoaded(booking: booking));
      } catch (e) {
        emit(BookingError(message: e.toString()));
      }
    });

    on<SelectBarber>((event, emit) {
      if (state is BookingLoaded) {
        final currentState = state as BookingLoaded;
        emit(currentState.copyWith(selectedBarber: event.barber));
      }
    });

    on<SelectDate>((event, emit) {
      if (state is BookingLoaded) {
        final currentState = state as BookingLoaded;
        emit(currentState.copyWith(selectedDate: event.date));
      }
    });

    on<SelectTime>((event, emit) {
      if (state is BookingLoaded) {
        final currentState = state as BookingLoaded;
        emit(currentState.copyWith(selectedTime: event.time));
      }
    });

    on<SelectService>((event, emit) {
      if (state is BookingLoaded) {
        final currentState = state as BookingLoaded;
        emit(currentState.copyWith(selectedService: event.service));
      }
    });

    on<CreateReservation>((event, emit) async {
      try {
        await repository.createReservation(event.reservationData);
        emit(BookingSuccess()); // Add a success state for reservation creation
      } catch (e) {
        emit(BookingError(
            message: "Failed to create reservation: ${e.toString()}"));
      }
    });
  }
}

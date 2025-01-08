import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/domain/usecases/cancel_reservation.dart';
import 'package:tlb_app/features/reservation/domain/usecases/get_reservation_history.dart';

// Import Events and States
import 'reservation_event.dart';
import 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final GetReservationHistory getReservationHistoryUseCase;
  // final CreateReservation createReservationUseCase;
  final CancelReservation cancelReservationUseCase;

  ReservationBloc({
    required this.getReservationHistoryUseCase,
    // required this.createReservationUseCase,
    required this.cancelReservationUseCase,
  }) : super(ReservationInitialState()) {
    on<LoadReservationHistoryEvents>(_onLoadReservationHistory);
    // on<CreateReservationEvent>(_onCreateReservation);
    on<CancelReservationEvent>(_onCancelReservation);
  }

  Future<void> _onLoadReservationHistory(LoadReservationHistoryEvents event,
      Emitter<ReservationState> emit) async {
    emit(ReservationLoadingState());
    try {
      final reservations =
          await getReservationHistoryUseCase.execute(event.userId);
      emit(ReservationLoadedState(reservations: reservations));
    } catch (error) {
      emit(ReservationFailureState(error.toString()));
    }
  }

  Future<void> _onCancelReservation(
      CancelReservationEvent event, Emitter<ReservationState> emit) async {
    emit(ReservationLoadingState());
    try {
      await cancelReservationUseCase.execute(event.reservationId);
      emit(ReservationCancelled());
    } catch (error) {
      emit(ReservationFailureState(error.toString()));
    }
  }
}

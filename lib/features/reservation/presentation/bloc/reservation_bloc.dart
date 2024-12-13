import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlb_app/features/reservation/domain/usecases/cancel_reservation.dart';
import 'package:tlb_app/features/reservation/domain/usecases/create_reservation.dart';
import 'package:tlb_app/features/reservation/domain/usecases/get_reservation_history.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_event.dart';
import 'package:tlb_app/features/reservation/presentation/bloc/reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  final CreateReservation createReservationEventsUseCase;
  final CancelReservation cancelReservationEventsUseCase;
  final GetReservationHistory getReservationHistoryUseCase;

  ReservationBloc({
    required this.createReservationEventsUseCase,
    required this.cancelReservationEventsUseCase,
    required this.getReservationHistoryUseCase,
  }) : super(ReservationInitialState()) {
    on<LoadReservationHistoryEvents>((event, emit) async {
      emit(ReservationLoadingState());
      try {
        final allReservations =
            await getReservationHistoryUseCase.execute(event.userId);
        final ongoing =
            allReservations.where((res) => res.status == 'ongoing').toList();
        final completed =
            allReservations.where((res) => res.status == 'completed').toList();
        final cancelled =
            allReservations.where((res) => res.status == 'canceled').toList();

        final history = [
          ...completed,
          ...cancelled,
        ];
        emit(ReservationLoadedState(
            ongoing: ongoing,
            history: history,
            completed: completed,
            canceled: cancelled));
      } catch (e) {
        emit(ReservationFailureState(e.toString()));
      }
    });
    // Create reservation
    on<CreateReservationEvents>((event, emit) async {
      emit(ReservationLoadingState());
      try {
        await createReservationEventsUseCase.execute(event.reservation);
      } catch (e) {
        emit(ReservationFailureState(e.toString()));
      }
    });

    on<CancelReservationEvents>((event, emit) async {
      emit(ReservationLoadingState());
      try {
        await cancelReservationEventsUseCase.execute(event.reservationId);
      } catch (e) {
        emit(ReservationFailureState(e.toString()));
      }
    });
  }
}

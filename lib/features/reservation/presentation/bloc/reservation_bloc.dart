import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc()
      : super(ReservationInitial(
          userImageURL: "Placeholder image",
          userName: "Guest",
        )) {
    on<LoadUserDataEvents>(_loadUserData);
    on<LoadReservationHistoryEvent>(
      (event, emit) {},
    );
    on<CheckCurrentReservationEvent>(
      (event, emit) {},
    );

    add(LoadUserDataEvents());
  }

  void _loadUserData(LoadUserDataEvents event, Emitter<ReservationState> emit) {
    final user = Supabase.instance.client.auth.currentUser;
    final userName = user?.userMetadata?['name'];
    final userImageURL = user?.userMetadata?['picture'];
    if (userName != null && userImageURL != null) {
      emit(ReservationInitial(userName: userName, userImageURL: userImageURL));
    }
  }
}

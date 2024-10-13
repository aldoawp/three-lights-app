import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'reservations_event.dart';
part 'reservations_state.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  ReservationsBloc()
      : super(ReservationsInitial(
          userImageURL: "Placeholder image",
          userName: "Guest",
        )) {
    final user = Supabase.instance.client.auth.currentUser;
    _initializeUserValue();
    on<LoadUserDataEvents>(_loadUserData);
  }

  void _initializeUserValue() {
    add(LoadUserDataEvents());
  }

  void _loadUserData(
      LoadUserDataEvents event, Emitter<ReservationsState> emit) {
    final user = Supabase.instance.client.auth.currentUser;
    log(user.toString());
  }
}

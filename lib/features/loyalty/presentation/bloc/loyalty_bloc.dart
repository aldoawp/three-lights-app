import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tlb_app/features/loyalty/presentation/widgets/history_item_data.dart';

part 'loyalty_event.dart';
part 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  final String uniqueCode = "unique-code-123";

  LoyaltyBloc() : super(LoyaltyInitial()) {
    on<QRScannedEvent>((event, emit) {
      if (state is LoyaltyUpdated) {
        final currentState = state as LoyaltyUpdated;
        if (event.qrCode == uniqueCode) {
          final updatedHistory =
              List<HistoryItemData>.from(currentState.history)
                ..add(HistoryItemData(
                    date: DateTime.now(),
                    status: "CHECK-IN",
                    stamp: "Stamp ke - ${currentState.history.length + 1}"));

          if (currentState.stamps + 1 >= 5) {
            emit(LoyaltyUpdated(stamps: 0, history: updatedHistory));
            add(ResetStampsEvent()); // Reset after showing the drawer
          } else {
            emit(LoyaltyUpdated(
                stamps: currentState.stamps + 1, history: updatedHistory));
          }
        } else {
          // Preserve state on invalid QR code
          emit(LoyaltyUpdated(
              stamps: currentState.stamps, // Preserve stamps
              history: currentState.history)); // Preserve history
          emit(ErrorState(message: "Invalid QR Code"));
        }
      } else {
        if (event.qrCode == uniqueCode) {
          final updatedHistory = List<HistoryItemData>.from([])
            ..add(HistoryItemData(
                date: DateTime.now(),
                status: "CHECK-IN",
                stamp: "Stamp ke - 1"));
          emit(LoyaltyUpdated(stamps: 1, history: updatedHistory));
        } else {
          // Preserve state on initial scan and invalid QR code
          emit(LoyaltyUpdated(
              stamps: 0, history: [])); // Reset on initial scan or invalid QR
          emit(ErrorState(message: "Invalid QR Code"));
        }
      }
    });

    on<ResetStampsEvent>((event, emit) {
      if (state is LoyaltyUpdated) {
        final currentState = state as LoyaltyUpdated;
        emit(LoyaltyUpdated(stamps: 0, history: currentState.history));
      }
    });
  }
}

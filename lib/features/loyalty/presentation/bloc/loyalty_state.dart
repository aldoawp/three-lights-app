part of 'loyalty_bloc.dart';

abstract class LoyaltyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoyaltyInitial extends LoyaltyState {}

class LoyaltyUpdated extends LoyaltyState {
  final int stamps;
  final List<HistoryItemData> history;

  LoyaltyUpdated({required this.stamps, required this.history});

  @override
  List<Object?> get props => [stamps, history];
}

class ErrorState extends LoyaltyState {
  // Define
  final String message;

  ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

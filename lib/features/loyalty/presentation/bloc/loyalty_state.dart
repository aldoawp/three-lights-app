part of 'loyalty_bloc.dart';

abstract class LoyaltyState extends Equatable {
  @override
  List<Object?> get props => [];

  get stamps => null;
}

class LoyaltyInitial extends LoyaltyState {}

class LoyaltyUpdated extends LoyaltyState {
  @override
  final int stamps;
  final List<HistoryItemData> history;

  LoyaltyUpdated({required this.stamps, required this.history});

  @override
  List<Object?> get props => [stamps, history];
}

class ErrorState extends LoyaltyState {
  // Define ErrorState
  final String message;

  ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

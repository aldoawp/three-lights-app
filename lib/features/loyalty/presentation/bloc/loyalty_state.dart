part of 'loyalty_bloc.dart';

abstract class LoyaltyState extends Equatable {
  const LoyaltyState();  

  @override
  List<Object> get props => [];
}
class LoyaltyInitial extends LoyaltyState {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loyalty_event.dart';
part 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  LoyaltyBloc() : super(LoyaltyInitial()) {
    on<LoyaltyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

part of 'loyalty_bloc.dart';

abstract class LoyaltyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QRScannedEvent extends LoyaltyEvent {
  final String qrCode;
  QRScannedEvent(this.qrCode);

  @override
  List<Object?> get props => [qrCode];
}

class ResetStampsEvent extends LoyaltyEvent {}

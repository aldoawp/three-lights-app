import 'package:equatable/equatable.dart';

class AvaibleDate extends Equatable {
  final int dateId;
  final String date;
  final String? status;

  const AvaibleDate({required this.dateId, required this.date, this.status});

  @override
  List<Object?> get props => [dateId, date];
}

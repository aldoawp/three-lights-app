import 'package:equatable/equatable.dart';

class AvaibleDate extends Equatable {
  final int dateId;
  final String date;

  const AvaibleDate({
    required this.dateId,
    required this.date,
  });

  @override
  List<Object?> get props => [dateId, date];
}

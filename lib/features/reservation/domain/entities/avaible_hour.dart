import 'package:equatable/equatable.dart';

class AvaibleHour extends Equatable {
  final int hourId;
  final String hour;
  final String? status;

  const AvaibleHour({required this.hourId, required this.hour, this.status});

  @override
  List<Object?> get props => [hourId, hour];
}

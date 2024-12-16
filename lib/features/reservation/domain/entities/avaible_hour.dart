import 'package:equatable/equatable.dart';

class AvaibleHour extends Equatable {
  final int hourId;
  final String hour;

  const AvaibleHour({required this.hourId, required this.hour});

  @override
  List<Object?> get props => [hourId, hour];
}

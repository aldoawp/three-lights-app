import 'package:equatable/equatable.dart';

class Barber extends Equatable {
  final int barberId;
  final String firstName;
  final String lastName;

  const Barber({
    required this.barberId,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [barberId, firstName, lastName];
}

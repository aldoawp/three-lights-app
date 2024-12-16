import 'package:equatable/equatable.dart';

class Service extends Equatable {
  final int serviceId;
  final String name;
  final int price;

  const Service({
    required this.serviceId,
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [serviceId, name, price];
}

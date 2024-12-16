import 'package:tlb_app/features/reservation/domain/entities/service.dart';

class ServiceModel extends Service {
  const ServiceModel({
    required int serviceid,
    required super.name,
    required super.price,
  }) : super(
          serviceId: serviceid,
        );

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceid: json['service_id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'service_id': serviceId, 'name': name, 'price': price};
  }

  /// Provide an empty instance of ServiceModel
  static ServiceModel empty() {
    return const ServiceModel(
      serviceid: 0,
      name: '',
      price: 0,
    );
  }
}

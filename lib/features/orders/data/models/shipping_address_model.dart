import 'package:fruit_app_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? addressDetails;

  const ShippingAddressModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.addressDetails,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      city: json['city'],
      addressDetails: json['addressDetails'],
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      city: city,
      addressDetails: addressDetails,
    );
  }
}

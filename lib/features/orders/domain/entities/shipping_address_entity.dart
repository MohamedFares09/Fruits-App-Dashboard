class ShippingAddressEntity {
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? city;
  final String? addressDetails;

  const ShippingAddressEntity({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.city,
    this.addressDetails,
  });

  String get fullAddress {
    return [city, address, addressDetails]
        .where((item) => item != null && item!.isNotEmpty)
        .join(', ');
  }
}

import 'package:fruit_app_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String code;

  const OrderProductModel({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.code,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      imageUrl: json['imageUrl'] ?? '',
      code: json['code'] ?? '',
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      price: price,
      quantity: quantity,
      imageUrl: imageUrl,
      code: code,
    );
  }
}

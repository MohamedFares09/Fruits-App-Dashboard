import 'package:fruit_app_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruit_app_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddress;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String status;
  final String? date;

  const OrderModel({
    required this.totalPrice,
    required this.uid,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: (json['totalPrice'] ?? 0).toDouble(),
      uid: json['uid'] ?? '',
      shippingAddress: ShippingAddressModel.fromJson(
        Map<String, dynamic>.from(json['shippingAddress'] ?? {}),
      ),
      orderProducts: json['orderProducts'] != null
          ? List<OrderProductModel>.from(
              json['orderProducts'].map(
                (product) => OrderProductModel.fromJson(
                  Map<String, dynamic>.from(product),
                ),
              ),
            )
          : [],
      paymentMethod: json['paymentMethod'] ?? '',
      status: json['status'] ?? 'pending',
      date: json['date'] ?? json['data'],
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      totalPrice: totalPrice,
      uid: uid,
      shippingAddress: shippingAddress.toEntity(),
      orderProducts: orderProducts.map((product) => product.toEntity()).toList(),
      paymentMethod: paymentMethod,
      status: status,
      date: date,
    );
  }
}

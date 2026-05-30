import 'package:fruit_app_dashboard/core/enums/order_enums.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uid;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderEnums status;
  final String? date;

  const OrderEntity({
    required this.totalPrice,
    required this.uid,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    this.date,
  });
}

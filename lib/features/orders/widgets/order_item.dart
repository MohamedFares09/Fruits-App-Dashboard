import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/utils/app_colors.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order.shippingAddress.name ?? 'No name',
                  style: AppTextStyles.bold16,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimaryColor.withValues(alpha: .12),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  order.status,
                  style: AppTextStyles.semibold13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text('User ID: ${order.uid}', style: AppTextStyles.regular13),
          const SizedBox(height: 4),
          Text(
            'Phone: ${order.shippingAddress.phoneNumber ?? ''}',
            style: AppTextStyles.regular13,
          ),
          const SizedBox(height: 4),
          Text(
            'Address: ${order.shippingAddress.fullAddress}',
            style: AppTextStyles.regular13,
          ),
          const Divider(height: 24),
          Text(
            'Products',
            style: AppTextStyles.bold13,
          ),
          const SizedBox(height: 8),
          ...order.orderProducts.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: AppTextStyles.regular13,
                    ),
                  ),
                  Text(
                    '${product.quantity} x ${product.price}',
                    style: AppTextStyles.semibold13,
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.paymentMethod,
                style: AppTextStyles.semibold13,
              ),
              Text(
                '${order.totalPrice} EGP',
                style: AppTextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

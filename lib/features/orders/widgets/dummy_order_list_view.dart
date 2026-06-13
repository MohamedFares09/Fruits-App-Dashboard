import 'package:flutter/material.dart';
import 'package:fruit_app_dashboard/core/enums/order_status.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DummyOrderListView extends StatelessWidget {
  const DummyOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView.separated(
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
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
                      const Text(
                        'Customer Name',
                        style: AppTextStyles.bold16,
                      ),
                      Text(
                        OrderStatus.pending.name,
                        style: AppTextStyles.semibold13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'User ID: user id',
                    style: AppTextStyles.regular13,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Phone: 01000000000',
                    style: AppTextStyles.regular13,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Address: Cairo, Street, Building',
                    style: AppTextStyles.regular13,
                  ),
                  const Divider(height: 24),
                  const Text('Products', style: AppTextStyles.bold13),
                  const SizedBox(height: 8),
                  const _DummyProductItem(),
                  const SizedBox(height: 10),
                  const _DummyProductItem(),
                  const Divider(height: 24),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PayPal', style: AppTextStyles.semibold13),
                      Text('250 EGP', style: AppTextStyles.bold16),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DummyProductItem extends StatelessWidget {
  const _DummyProductItem();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product Name', style: AppTextStyles.semibold13),
              SizedBox(height: 4),
              Text('product-code', style: AppTextStyles.regular13),
            ],
          ),
        ),
        const Text('2 x 100', style: AppTextStyles.semibold13),
      ],
    );
  }
}

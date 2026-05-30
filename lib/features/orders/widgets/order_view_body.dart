import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_app_dashboard/features/orders/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fruit_app_dashboard/features/orders/widgets/dummy_order_list_view.dart';
import 'package:fruit_app_dashboard/features/orders/widgets/order_item.dart';

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderSuccess) {
          if (state.orders.isEmpty) {
            return const Center(
              child: Column(
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text('No orders yet', style: AppTextStyles.bold16),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ListView.separated(
              itemCount: state.orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return OrderItem(order: state.orders[index]);
              },
            ),
          );
        }

        if (state is OrderFailure) {
          return Center(
            child: Text(state.errorMessage, style: AppTextStyles.bold16),
          );
        }

        return const DummyOrderListView();
      },
    );
  }
}

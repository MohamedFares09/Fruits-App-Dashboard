import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/enums/order_status.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/manager/updata_order/updata_order_cubit.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderActionButton extends StatelessWidget {
  const OrderActionButton({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatus.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdataOrderCubit>().updataOrder(
                orderId: orderEntity.orderId,
                orderStatus: OrderStatus.accepted,
              );
            },
            child: Text("Accept"),
          ),
        ),
        SizedBox(width: 12),
        Visibility(
          visible: orderEntity.status == OrderStatus.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdataOrderCubit>().updataOrder(
                orderId: orderEntity.orderId,
                orderStatus: OrderStatus.canceled,
              );
            },
            child: Text("Reject"),
          ),
        ),
        SizedBox(width: 12),
        Visibility(
          visible: orderEntity.status == OrderStatus.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdataOrderCubit>().updataOrder(
                orderId: orderEntity.orderId,
                orderStatus: OrderStatus.completed,
              );
            },
            child: Text("Delivered"),
          ),
        ),
      ],
    );
  }
}

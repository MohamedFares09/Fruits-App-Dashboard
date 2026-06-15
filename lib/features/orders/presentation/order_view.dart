  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/repos/order_repo.dart';
import 'package:fruit_app_dashboard/core/services/get_it.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/manager/updata_order/updata_order_cubit.dart';
import 'package:fruit_app_dashboard/features/orders/presentation/manager/order_cubit/order_cubit.dart';
import 'package:fruit_app_dashboard/features/orders/widgets/order_view_body.dart';
import 'package:fruit_app_dashboard/features/orders/widgets/updata_order_builder.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});
  static const String route = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<OrderCubit>(
            create: (context) => OrderCubit(getit.get<OrderRepo>())..getOrders(),
          ),
             BlocProvider<UpdataOrderCubit>(
            create: (context) => UpdataOrderCubit(getit.get<OrderRepo>()),
          ),
        ],
        child: UpdataOrderBuilder(child: const OrderViewBody()),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/repos/order_repo.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;

  void getOrders() async {
    if (isClosed) return;
    emit(OrderLoading());
    await for (var orders in orderRepo.getOrders()) {
      orders.fold(
        (f) {
          emit(OrderFailure(f.message));
        },
        (orders) {
          emit(OrderSuccess(orders));
        },
      );
    }
  }
}

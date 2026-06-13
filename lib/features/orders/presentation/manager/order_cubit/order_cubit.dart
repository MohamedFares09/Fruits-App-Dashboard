import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/repos/order_repo.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderRepo) : super(OrderInitial());

  final OrderRepo orderRepo;
  StreamSubscription? streamSubscription;
  void getOrders() {
    if (isClosed) return;
    emit(OrderLoading());
    streamSubscription = orderRepo.getOrders().listen((result) {
      result.fold(
        (f) {
          emit(OrderFailure(f.message));
        },
        (orders) {
          emit(OrderSuccess(orders));
        },
      );
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}

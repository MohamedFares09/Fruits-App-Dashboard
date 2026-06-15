
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/enums/order_status.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/repos/order_repo.dart';
import 'package:meta/meta.dart';

part 'updata_order_state.dart';

class UpdataOrderCubit extends Cubit<UpdataOrderState> {
  UpdataOrderCubit(this.orderRepo) : super(UpdataOrderInitial());
  final OrderRepo orderRepo;
  Future<void> updataOrder({
    required String orderId,
    required OrderStatus orderStatus,
  }) async {
    emit(UpdataOrderLoading());
    final result = await orderRepo.updateOrder(
      orderId: orderId,
      orderStatus: orderStatus, 
    );
    result.fold(
      (f) => emit(UpdataOrderFailure(errorMessage: f.message)),
      (_) => emit(UpdataOrderSuccess()),
    );
  }
}

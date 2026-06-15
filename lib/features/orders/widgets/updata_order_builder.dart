import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/helper_function/build_snak_bar.dart';
import 'package:fruit_app_dashboard/features/add_product/presentation/manager/updata_order/updata_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdataOrderBuilder extends StatelessWidget {
  const UpdataOrderBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdataOrderCubit, UpdataOrderState>(
      listener: (context, state) {
        if (state is UpdataOrderSuccess) {
          buildsnakbar(
            context,
            "Order updated successfully",
            const Color(0xFF4CAF50),
          );
        } else if (state is UpdataOrderFailure) {
          buildsnakbar(context, state.errorMessage, const Color(0xFFF44336));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdataOrderLoading,
          child: child,
        );
        ;
      },
    );
  }
}

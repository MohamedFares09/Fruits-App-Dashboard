part of 'updata_order_cubit.dart';

@immutable
sealed class UpdataOrderState {}

final class UpdataOrderInitial extends UpdataOrderState {}

final class UpdataOrderLoading extends UpdataOrderState {}

final class UpdataOrderFailure extends UpdataOrderState {
  final String errorMessage;

  UpdataOrderFailure({required this.errorMessage});
}

final class UpdataOrderSuccess extends UpdataOrderState {}

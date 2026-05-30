import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
}

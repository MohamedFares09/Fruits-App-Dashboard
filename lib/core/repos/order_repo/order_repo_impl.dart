import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/core/repos/order_repo/order_repo.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';
import 'package:fruit_app_dashboard/core/utils/back_end.dart';
import 'package:fruit_app_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseServices dataBaseServices;

  OrderRepoImpl(this.dataBaseServices);

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      var data = await dataBaseServices.getData(path: BackEnd.orders)
          as List<Map<String, dynamic>>;
      var orders =
          data.map((order) => OrderModel.fromJson(order).toEntity()).toList();
      return right(orders);
    } catch (e) {
      return left(ServerFailure("Something went wrong"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/enums/order_status.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/repos/order_repo.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';
import 'package:fruit_app_dashboard/core/utils/back_end.dart';
import 'package:fruit_app_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruit_app_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseServices dataBaseServices;

  OrderRepoImpl(this.dataBaseServices);

  @override
  Stream<Either<Failure, List<OrderEntity>>> getOrders() async* {
    try {
      await for (var (data as List<Map<String, dynamic>>)
          in dataBaseServices.getStreamData(path: BackEnd.orders)) {
        var orders = data
            .map((order) => OrderModel.fromJson(order).toEntity())
            .toList();
        yield right(orders);
      }
    } catch (e) {
      yield left(ServerFailure("Something went wrong $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderStatus orderStatus,
    required String orderId,
  }) async {
    try {
      dataBaseServices.updataData(
        path: BackEnd.updataOrder,
        data: {'status': orderStatus.name},
        documentId: orderId,
      );
      return right(null);
    } catch (e) {
      return Left(ServerFailure("Failed to updata order"));
    }
  }
}

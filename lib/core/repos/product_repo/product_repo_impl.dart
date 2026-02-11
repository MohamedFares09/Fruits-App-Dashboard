import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';
import 'package:fruit_app_dashboard/core/utils/back_end.dart';
import 'package:fruit_app_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/entities/add_product_entity.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseServices dataBaseServices;

  ProductRepoImpl(this.dataBaseServices);
  @override
  Future<Either<Failure, void>> addProduct(
    AddProductEntity addProductEntity,
  ) async {
    try {
      await dataBaseServices.addData(
        path: BackEnd.addProducts,
        data: AddProductModel.fromEntity(addProductEntity).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure("Something went wrong"));
    }
  }
}

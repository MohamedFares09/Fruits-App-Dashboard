import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/entities/add_product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(AddProductEntity addProductEntity);
}
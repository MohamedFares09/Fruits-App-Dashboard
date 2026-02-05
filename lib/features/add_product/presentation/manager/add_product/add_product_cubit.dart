import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_app_dashboard/features/add_product/doman/entities/add_product_entity.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
    : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductRepo productRepo;
  Future<void> addProduct(AddProductEntity addProductEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductEntity.image);
    result.fold((failure) => emit(AddProductFailure(failure.message)), (
      url,
    ) async {
      addProductEntity.urlImage = url;
      var result = await productRepo.addProduct(addProductEntity);
      result.fold((failure) => emit(AddProductFailure(failure.message)), (r) {
        emit(AddProductSuccess());
      });
    });
  }
}

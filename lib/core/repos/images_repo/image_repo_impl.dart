import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/core/services/storage_services.dart';
import 'package:fruit_app_dashboard/core/utils/back_end.dart';

class ImageRepoImpl implements ImageRepo {
  final StorageServices storageServices;
  ImageRepoImpl(this.storageServices);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageServices.uploadImage(image, BackEnd.images);
      return Right(url);
    } on Exception catch (e) {
      return Left(ServerFailure("Failed to upload image"));
    }
  }
}

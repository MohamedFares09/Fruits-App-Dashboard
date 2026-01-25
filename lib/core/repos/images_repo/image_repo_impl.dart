import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_app_dashboard/core/errors/failuer.dart';
import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
   
    throw UnimplementedError();
  }

}
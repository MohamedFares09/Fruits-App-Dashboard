import 'dart:io';

abstract  class ImageRepo {
  Future<void> uploadImage(File image);
}
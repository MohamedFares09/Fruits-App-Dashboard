import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_app_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart ' as b;

class FileStorage implements StorageServices {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String path) async {
    var fileName = b.basename(file.path);
    var extension = b.extension(file.path);
    var ref = storageReference.child('$path/$fileName$extension');
    await ref.putFile(file);
    var imageUrl = await ref.getDownloadURL();
    return imageUrl;
  }
}

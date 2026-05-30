import 'dart:io';

import 'package:fruit_app_dashboard/constants.dart';
import 'package:fruit_app_dashboard/core/services/storage_services.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageServices {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseAnonKey,
    );
  }

  @override
  Future<String> uploadImage(File file, String path) async {
    final fileName = b.basename(file.path);
    final extensionName = b.extension(fileName);
    final result = await _supabase.client.storage
        .from(kBucketFruitImages)
        .upload('$path/$fileName.$extensionName', file);

    final String publicUrl = _supabase.client.storage
        .from(kBucketFruitImages)
        .getPublicUrl('$path/$fileName.$extensionName');
    return result;
  }
}

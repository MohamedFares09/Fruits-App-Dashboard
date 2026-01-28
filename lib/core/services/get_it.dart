import 'package:fruit_app_dashboard/core/services/file_storage.dart';
import 'package:fruit_app_dashboard/core/services/storage_services.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupGetIt() {
  getit.registerLazySingleton<StorageServices>(() => FileStorage());
}

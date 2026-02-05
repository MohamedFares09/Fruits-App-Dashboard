import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruit_app_dashboard/core/repos/images_repo/image_repo_impl.dart';
import 'package:fruit_app_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruit_app_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruit_app_dashboard/core/services/database_services.dart';
import 'package:fruit_app_dashboard/core/services/file_storage.dart';
import 'package:fruit_app_dashboard/core/services/firestore_services.dart';
import 'package:fruit_app_dashboard/core/services/storage_services.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void setupGetIt() {
  getit.registerLazySingleton<StorageServices>(() => FileStorage());
  getit.registerLazySingleton<DataBaseServices>(() => FireStoreServices());
  getit.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(getit.get<StorageServices>()),
  );
  getit.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(getit.get<DataBaseServices>()),
  );
}

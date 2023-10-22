import 'package:get_it/get_it.dart';
import 'package:l0_data/firebase/export.dart';
import 'package:l0_data/firebase/services/firebase_service.dart';
import 'package:l0_data/firebase/services/i_firebase_service.dart';
import 'package:l0_data/storage/storage_service.dart';
import 'package:l1_domain/features/auth/export.dart';
import 'package:l1_domain/storage/export.dart';
import 'package:thrillie/navigation/app_router.dart';

class DI {
  static GetIt instance = GetIt.instance;

  void setUp() {
    instance
      ..registerSingleton<IFirebaseService>(
        FirebaseService(),
      )
      ..registerSingleton<AppRouter>(
        AppRouter(),
      )
      ..registerFactory<IStorageService>(
        StorageService.new,
      )
      ..registerFactory<IFirebaseUserMapper>(
        FirebaseUserMapper.new,
      )
      ..registerLazySingleton<IAuthenticationService>(
        () => FirebaseAuthenticationService(
          storageService: instance.get(),
          userMapper: instance.get(),
        ),
      );
  }
}

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtrack/data/datasources/local/subscription_catalog_local_data_source.dart';
import 'package:subtrack/data/preferences/app_preferences.dart';
import 'package:subtrack/data/repositories/subscription/subscription_catalog_repository.dart';
import 'package:subtrack/data/repositories/subscription/subscription_catalog_repository_impl.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository_impl.dart';
import 'package:subtrack/features/purchase/repositories/fake_purchase_repository.dart';
import 'package:subtrack/features/purchase/repositories/purchase_repository.dart';

import '../database/isar_database.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  getIt.registerLazySingleton<IsarDatabase>(() => IsarDatabase.instance);

  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(database: getIt<IsarDatabase>()),
  );

  getIt.registerLazySingleton<SubscriptionCatalogLocalDataSource>(() => SubscriptionCatalogLocalDataSource());

  getIt.registerLazySingleton<SubscriptionCatalogRepository>(
    () => SubscriptionCatalogRepositoryImpl(dataSource: getIt<SubscriptionCatalogLocalDataSource>()),
  );

  getIt.registerLazySingleton<PurchaseRepository>(FakePurchaseRepository.new);

  //
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt<SharedPreferences>()));
}

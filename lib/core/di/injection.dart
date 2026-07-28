import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:subtrack/data/preferences/app_preferences.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository_impl.dart';

import '../database/isar_database.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  getIt.registerLazySingleton<IsarDatabase>(() => IsarDatabase.instance);

  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(database: getIt<IsarDatabase>()),
  );

  //
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt<SharedPreferences>()));
}

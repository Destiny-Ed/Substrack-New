import 'package:get_it/get_it.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository_impl.dart';

import '../database/isar_database.dart';

final getIt = GetIt.instance;

Future<void> setupInjection() async {
  getIt.registerLazySingleton<IsarDatabase>(() => IsarDatabase.instance);

  getIt.registerLazySingleton<SubscriptionRepository>(
    () => SubscriptionRepositoryImpl(database: getIt<IsarDatabase>()),
  );
}

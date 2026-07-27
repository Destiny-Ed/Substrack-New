import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';

class IsarDatabase {
  IsarDatabase._();

  static final IsarDatabase instance = IsarDatabase._();

  Isar? _isar;

  Future<Isar> get database async {
    if (_isar != null) {
      return _isar!;
    }

    final directory = await getApplicationDocumentsDirectory();

    _isar = await Isar.open([SubscriptionSchema], directory: directory.path, inspector: true);

    return _isar!;
  }

  Future<void> close() async {
    await _isar?.close();
    _isar = null;
  }
}

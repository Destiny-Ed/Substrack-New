import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:subtrack/data/models/subscriptions/subscription_models.dart';
import 'package:subtrack/data/repositories/subscription/subscription_repository.dart';


class SubscriptionDetailsViewModel extends ChangeNotifier {
  SubscriptionDetailsViewModel({SubscriptionRepository? repository}) : _repository = repository ?? GetIt.I<SubscriptionRepository>();

  final SubscriptionRepository _repository;

  Subscription? _subscription;

  Subscription? get subscription => _subscription;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> load(String id) async {
    _isLoading = true;
    notifyListeners();

    _subscription = await _repository.getById(id);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> archive() async {
    if (_subscription == null) return;

    final archived = _subscription!.copyWith(isArchived: true);

    await _repository.update(archived);

    _subscription = archived;

    notifyListeners();
  }

  Future<bool> delete(BuildContext context) async {
    if (_subscription == null) {
      return false;
    }

    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Delete Subscription"),
            content: const Text("This action cannot be undone."),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Cancel")),
              FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text("Delete")),
            ],
          ),
        ) ??
        false;

    if (!confirmed) {
      return false;
    }

    await _repository.delete(_subscription!.id);

    return true;
  }
}

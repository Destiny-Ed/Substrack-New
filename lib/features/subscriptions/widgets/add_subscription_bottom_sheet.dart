import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtrack/core/widgets/app_selection_bottom_sheet.dart';
import 'package:subtrack/data/models/subscriptions/subscription_catalog.dart';
import 'package:subtrack/features/subscriptions/view_models/add_subscription_vm.dart';

import '../../../core/enums.dart';

Future<bool?> showAddSubscriptionBottomSheet(
  BuildContext context, {
  SubscriptionCatalog? catalog,
  String? initialName,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: true,
    builder: (_) => ChangeNotifierProvider.value(
      value: context.read<AddSubscriptionViewModel>(),
      child: AddSubscriptionBottomSheet(catalog: catalog, initialName: initialName),
    ),
  );
}

class AddSubscriptionBottomSheet extends StatefulWidget {
  const AddSubscriptionBottomSheet({super.key, this.catalog, this.initialName});

  final SubscriptionCatalog? catalog;
  final String? initialName;

  @override
  State<AddSubscriptionBottomSheet> createState() => _AddSubscriptionBottomSheetState();
}

class _AddSubscriptionBottomSheetState extends State<AddSubscriptionBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _priceController;

  BillingCycle _billingCycle = BillingCycle.monthly;

  String _currency = 'USD';

  DateTime _renewalDate = DateTime.now().add(const Duration(days: 30));

  bool _autoRenew = true;

  late SubscriptionCategory _category;

  bool _saving = false;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.catalog?.name ?? widget.initialName ?? '');

    _priceController = TextEditingController();

    _category = widget.catalog?.category ?? SubscriptionCategory.other;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  bool get _isCustom => widget.catalog == null;

  Future<void> _pickRenewalDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _renewalDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked == null) return;

    setState(() {
      _renewalDate = picked;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate() || _saving) {
      return;
    }

    setState(() {
      _saving = true;
    });

    final vm = context.read<AddSubscriptionViewModel>();

    final price = double.parse(_priceController.text);

    try {
      if (_isCustom) {
        await vm.saveCustomSubscription(
          name: _nameController.text.trim(),
          category: _category,
          price: price,
          currency: _currency,
          billingCycle: _billingCycle,
          renewalDate: _renewalDate,
          autoRenew: _autoRenew,
        );
      } else {
        await vm.saveSubscription(
          service: widget.catalog!,
          price: price,
          currency: _currency,
          billingCycle: _billingCycle,
          renewalDate: _renewalDate,
          autoRenew: _autoRenew,
        );
      }

      if (!mounted) return;

      Navigator.pop(context, true);
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Unable to save subscription')));
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isCustom ? 'Create Subscription' : widget.catalog!.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),

                if (_isCustom)
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Subscription Name'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required';
                      }

                      return null;
                    },
                  ),

                if (_isCustom)
                  InkWell(
                    onTap: () async {
                      final category = await showAppSelectionBottomSheet(
                        context: context,
                        title: 'Subscription Category',
                        items: SubscriptionCategory.values,
                        selectedValue: _category,
                        labelBuilder: (e) => e.name,
                      );

                      if (category == null) return;

                      setState(() {
                        _category = category;
                      });
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Category'),
                      child: Row(
                        children: [
                          Expanded(child: Text(_category.name)),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Price', prefixText: '\$ '),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Required';
                    }

                    return null;
                  },
                ),

                InkWell(
                  onTap: () async {
                    final currency = await showAppSelectionBottomSheet(
                      context: context,
                      title: 'Currency',
                      items: const ['USD', 'EUR', 'GBP', 'NGN'],
                      selectedValue: _currency,
                      labelBuilder: (e) => e,
                    );

                    if (currency == null) return;

                    setState(() {
                      _currency = currency;
                    });
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Currency'),
                    child: Row(
                      children: [
                        Expanded(child: Text(_currency)),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () async {
                    final cycle = await showAppSelectionBottomSheet(
                      context: context,
                      title: 'Billing Cycle',
                      items: BillingCycle.values,
                      selectedValue: _billingCycle,
                      labelBuilder: (e) => e.name,
                    );

                    if (cycle == null) return;

                    setState(() {
                      _billingCycle = cycle;
                    });
                  },
                  child: InputDecorator(
                    decoration: const InputDecoration(labelText: 'Billing Cycle'),
                    child: Row(
                      children: [
                        Expanded(child: Text(_billingCycle.name)),
                        const Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Renewal Date'),
                    subtitle: Text("${_renewalDate.day}/${_renewalDate.month}/${_renewalDate.year}"),
                    trailing: const Icon(Icons.calendar_month),
                    onTap: _pickRenewalDate,
                  ),
                ),

                Material(
                  color: Colors.transparent,

                  child: SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Auto Renew'),
                    value: _autoRenew,
                    onChanged: (value) {
                      setState(() {
                        _autoRenew = value;
                      });
                    },
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _save,
                    child: _saving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save Subscription'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

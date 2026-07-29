import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subtrack/core/enums.dart';

import '../../../../data/models/subscriptions/subscription_models.dart';

class RenewalCard extends StatelessWidget {
  const RenewalCard({super.key, required this.subscription});

  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final renewalDate = subscription.isTrial && subscription.trialEndDate != null
        ? subscription.trialEndDate!
        : subscription.renewalDate;

    final daysRemaining = renewalDate.difference(DateTime.now()).inDays;

    final title = subscription.isTrial ? "Trial Ends" : "Next Renewal";

    final subtitle = subscription.isTrial
        ? "You'll be charged after your trial ends."
        : "Your next billing date.";

    final (color, icon) = _status(daysRemaining);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: color.withOpacity(.15),
                child: Icon(icon, color: color),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text(subtitle, style: theme.textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            DateFormat.yMMMMd().format(renewalDate),
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            _timeText(daysRemaining),
            style: theme.textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w600),
          ),

          if (subscription.isTrial) ...[
            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.payments_outlined, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "After your trial you'll pay ${subscription.currency} ${subscription.price.toStringAsFixed(2)} ${_billingCycle(subscription)}",
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _billingCycle(Subscription subscription) {
    switch (subscription.billingCycle) {
      case BillingCycle.weekly:
        return "per week";
      case BillingCycle.monthly:
        return "per month";
      case BillingCycle.quarterly:
        return "every 3 months";
      case BillingCycle.semiAnnually:
        return "every 6 months";
      case BillingCycle.yearly:
        return "per year";
      case BillingCycle.custom:
        // TODO: Handle this case.
        throw UnimplementedError();
      case BillingCycle.daily:
        return "per day";
    }
  }

  (Color, IconData) _status(int days) {
    if (days <= 1) {
      return (Colors.red, Icons.warning_amber_rounded);
    }

    if (days <= 7) {
      return (Colors.orange, Icons.schedule);
    }

    return (Colors.green, Icons.event_available);
  }

  String _timeText(int days) {
    if (days < 0) {
      return "Expired";
    }

    if (days == 0) {
      return "Today";
    }

    if (days == 1) {
      return "Tomorrow";
    }

    return "In $days days";
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:subtrack/data/enums.dart';

// class SubscriptionFormViewModel extends ChangeNotifier {
//   final formKey = GlobalKey<FormState>();

//   late TextEditingController nameController;
//   late TextEditingController priceController;
//   late TextEditingController notesController;

//   BillingCycle billingCycle;

//   String currency;

//   DateTime renewalDate;

//   SubscriptionCategory category;

//   bool autoRenew;

//   bool isSaving;

//   bool get isCustom;

//   Future<bool> save();

//   Future<void> pickRenewalDate(BuildContext context);

//   void setBillingCycle(...);

//   void setCurrency(...);

//   void setCategory(...);

//   void toggleAutoRenew(...);
// }
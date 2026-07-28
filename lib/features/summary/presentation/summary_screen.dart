// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:subtrack/core/navigation/app_routes.dart';

// class SummaryScreen extends StatelessWidget {
//   const SummaryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => SummaryViewModel()..load(),
//       child: Consumer<SummaryViewModel>(
//         builder: (_, vm, __) {
//           return Scaffold(
//             appBar: AppBar(automaticallyImplyLeading: false),
//             body: vm.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : SafeArea(
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: ListView(
//                             padding: const EdgeInsets.all(20),
//                             children: [
//                               const SizedBox(height: 12),

//                               const Icon(Icons.check_circle_rounded, color: Colors.green, size: 72),

//                               const SizedBox(height: 20),

//                               Text(
//                                 "You're all set!",
//                                 textAlign: TextAlign.center,
//                                 style: Theme.of(
//                                   context,
//                                 ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
//                               ),

//                               const SizedBox(height: 8),

//                               Text(
//                                 "We've started tracking your subscriptions.",
//                                 textAlign: TextAlign.center,
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                               ),

//                               const SizedBox(height: 32),

//                               SpendingCard(amount: vm.monthlyTotal),

//                               const SizedBox(height: 16),

//                               SubscriptionPreviewList(subscriptions: vm.subscriptions),

//                               const SizedBox(height: 16),

//                               if (vm.nextRenewal != null) NextRenewalCard(subscription: vm.nextRenewal!),

//                               const SizedBox(height: 16),

//                               YearlySpendingCard(yearlyAmount: vm.yearlyTotal),
//                             ],
//                           ),
//                         ),

//                         ContinueButton(
//                           onPressed: () {
//                             context.go(AppRoutes.paywall);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//           );
//         },
//       ),
//     );
//   }
// }

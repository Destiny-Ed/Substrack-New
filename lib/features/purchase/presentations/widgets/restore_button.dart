import 'package:flutter/material.dart';

class RestoreButton extends StatelessWidget {
  const RestoreButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(onPressed: onPressed, child: const Text("Restore Purchases")),
    );
  }
}

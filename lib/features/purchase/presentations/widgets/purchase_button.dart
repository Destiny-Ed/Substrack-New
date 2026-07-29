import 'package:flutter/material.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key, required this.onPressed, required this.isLoading});

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(strokeWidth: 2))
            : const Text(
                "Start 7-Day Free Trial",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}

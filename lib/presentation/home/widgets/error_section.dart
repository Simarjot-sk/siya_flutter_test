import 'package:flutter/material.dart';

class ErrorSection extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetryClicked;

  const ErrorSection({super.key, required this.errorMessage, required this.onRetryClicked});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: onRetryClicked,
            child: const Text("Retry"),
          )
        ],
      ),
    );;
  }
}

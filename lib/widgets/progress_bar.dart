import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final String label;

  const ProgressBar({super.key, required this.progress, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: progress,
          minHeight: 14,
          borderRadius: BorderRadius.circular(12),
        ),
        const SizedBox(height: 10),
        Text("${(progress * 100).toStringAsFixed(1)}%"),
      ],
    );
  }
}

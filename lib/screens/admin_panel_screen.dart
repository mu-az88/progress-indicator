import 'package:flutter/material.dart';
import 'package:progress_indicator/services/firestore_services.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({super.key});

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  double progress = 0;
  final service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Control")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: progress,
            min: 0,
            max: 100,
            divisions: 100,
            label: progress.round().toString(),
            onChanged: (value) {
              setState(() => progress = value);
              service.updateProgress(value);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:progress_indicator/services/firestore_services.dart';
import 'package:progress_indicator/widgets/progress_bar.dart';

class UserProgressScreen extends StatelessWidget {
  const UserProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Progress"),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock),
            onPressed: () => Navigator.pushNamed(context, '/admin-login'),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
          stream: service.progressStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            var data = snapshot.data!.data() as Map<String, dynamic>? ?? {};
            double progress = (data['progress'] ?? 0) / (data['max'] ?? 100);
            String label = data['label'] ?? '';

            return ProgressBar(progress: progress, label: label);
          },
        ),
      ),
    );
  }
}

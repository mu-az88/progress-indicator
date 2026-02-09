import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Stream<DocumentSnapshot> progressStream() {
    return _db.collection('appData').doc('progress').snapshots();
  }

  Future<void> updateProgress(double value) {
    return _db
        .collection('appData')
        .doc('progress')
        .set({'progress': value, 'max': 100, 'label': 'Project Completion'});
  }
}

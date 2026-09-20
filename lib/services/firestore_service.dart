import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cvity/models/resumeAnalysis.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> saveResumeAnalysis(
    ResumeAnalysis analysis,
  ) async {
    final user = _auth.currentUser;

    if (user == null) {
      throw Exception('User is not logged in');
    }

    await _db
        .collection('users')
        .doc(user.uid)
        .collection('resumes')
        .add({
          ...analysis.toMap(),
          'createdAt': FieldValue.serverTimestamp(),
        });
  }

  Future<List<ResumeAnalysis>> getResumeAnalyses() async {
  final user = _auth.currentUser;

  if (user == null) {
    throw Exception('User is not logged in');
  }

  final snapshot = await _db
      .collection('users')
      .doc(user.uid)
      .collection('resumes')
      .orderBy('createdAt', descending: true)
      .get();

  return snapshot.docs.map((doc) {
    return ResumeAnalysis.fromJson(doc.data());
  }).toList();
}
}
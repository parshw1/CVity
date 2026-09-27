import 'package:cvity/models/resumeAnalysis.dart';
import 'package:cvity/screens/resume_details.dart';
import 'package:flutter/material.dart';
import 'package:cvity/services/firestore_service.dart';

class ResumeHistory extends StatefulWidget {
  const ResumeHistory({super.key});

  @override
  State<ResumeHistory> createState() => _ResumeHistoryState();
}

class _ResumeHistoryState extends State<ResumeHistory> {
  final FirestoreService firestoreService = FirestoreService();

  List<ResumeAnalysis> resumes = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadResumes();
  }

  Future<void> loadResumes() async {
    try {
      final data = await firestoreService.getResumeAnalyses();

      setState(() {
        resumes = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      debugPrint('Error loading resumes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume History')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : resumes.isEmpty
          ? const Center(child: Text('No resumes analyzed yet'))
          : ListView.builder(
              itemCount: resumes.length,
              itemBuilder: (context, index) {
                final resume = resumes[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text('Resume ${index + 1}'),
                    subtitle: Text('Score: ${resume.score}/100'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResumeDetails(analysis: resume),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

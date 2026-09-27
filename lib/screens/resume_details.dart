import 'package:flutter/material.dart';
import 'package:cvity/models/resumeAnalysis.dart';

class ResumeDetails extends StatelessWidget {
  final ResumeAnalysis analysis;

  const ResumeDetails({
    super.key,
    required this.analysis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Analysis'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resume Score',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '${analysis.score}/100',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            buildSection(
              'Summary',
              analysis.summary,
            ),

            buildListSection(
              'Technical Skills',
              analysis.technicalSkills,
            ),

            buildListSection(
              'Soft Skills',
              analysis.softSkills,
            ),

            buildListSection(
              'Strengths',
              analysis.strengths,
            ),

            buildListSection(
              'Weaknesses',
              analysis.weaknesses,
            ),

            buildListSection(
              'Recommended Skills',
              analysis.recommendedSkills,
            ),

            buildListSection(
              'Improvements',
              analysis.improvements,
            ),

            buildListSection(
              'Suitable Job Roles',
              analysis.jobRoles,
            ),

            buildSection(
              'ATS Compatibility',
              analysis.atsCompatibility,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(
    String title,
    String content,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  Widget buildListSection(
    String title,
    List<String> items,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• '),
                  Expanded(
                    child: Text(item),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
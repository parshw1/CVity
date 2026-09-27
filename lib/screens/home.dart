import 'dart:convert';

import 'package:cvity/services/firestore_service.dart';
import 'package:cvity/models/resumeAnalysis.dart';
import 'package:cvity/services/gemini_services.dart';
import 'package:cvity/widgets/background_glow.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final FirestoreService _firestoreService = FirestoreService();

  bool isLoading = false;

  ResumeAnalysis? analysis;

  final TextEditingController resumeController = TextEditingController();

  Future<void> analyzeResume() async {
    final String resumeText = resumeController.text.trim();

    if (resumeText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your resume')));

      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final String result = await GeminiService.analyzeResume(resumeText);

      final Map<String, dynamic> jsonResult = jsonDecode(result);

      final ResumeAnalysis resumeAnalysis = ResumeAnalysis.fromJson(jsonResult);

      await _firestoreService.saveResumeAnalysis(resumeAnalysis);

      setState(() {
        analysis = resumeAnalysis;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Something went wrong: $e')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    resumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          const AnimatedGlowBackground(
            child: SizedBox.expand(),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'Resume Analyzer',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontFamily: "ChangaOne",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Text('Describe Yourself In the given text area below'),
                      SizedBox(height: 8),
                      Text('OR'),
                      SizedBox(height: 8),
                      Text('Upload your resume file below'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: resumeController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Paste your resume here...',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: isLoading ? null : analyzeResume,
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Analyze Resume'),
                ),

                SizedBox(height: 30),

                if (analysis != null) buildAnalysis(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickResume();
        },
        child: const Icon(Icons.file_upload),
      ),
    );
  }

  Widget buildAnalysis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Resume Score', style: Theme.of(context).textTheme.headlineSmall),

        SizedBox(height: 10),

        Text(
          '${analysis!.score}/100',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),

        Text(
          'Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 8),

        Text(analysis!.summary),

        SizedBox(height: 20),

        buildListSection('Technical Skills', analysis!.technicalSkills),

        buildListSection('Soft Skills', analysis!.softSkills),

        buildListSection('Strengths', analysis!.strengths),

        buildListSection('Weaknesses', analysis!.weaknesses),

        buildListSection('Recommended Skills', analysis!.recommendedSkills),

        buildListSection('Improvements', analysis!.improvements),

        buildListSection('Suitable Job Roles', analysis!.jobRoles),

        SizedBox(height: 20),

        Text(
          'ATS Compatibility',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 8),

        Text(analysis!.atsCompatibility),
      ],
    );
  }

  Widget buildListSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),

        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 8),

        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• '),

                Expanded(child: Text(item)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void pickResume() async {
    PlatformFile? result = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      resumeController.text = result.path ?? '';
    }
  }
}

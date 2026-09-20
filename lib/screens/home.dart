import 'package:flutter/material.dart';
import 'package:cvity/widgets/pickPdf.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
  bool isResumeUploaded = false;
  final Screenwidth = MediaQuery.of(context).size.width;
  final Screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
     
      body: Center(
        child: isResumeUploaded ? 
        
        Center(
          child: Text(
            'Resume Uploaded Successfully!',
            style: TextStyle(fontSize: 18),
          ),
        )
       
       : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please upload your resume.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickPdf();
        },
        child: Icon(Icons.upload_file),
      ),
    );
  }
}
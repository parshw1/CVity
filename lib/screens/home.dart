import 'package:flutter/material.dart';
import 'package:cvity/widgets/file_picker.dart';

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
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 183, 144, 250),
        
      ),
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
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  pickPdf(); 
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(Screenwidth * 0.8, Screenheight * 0.06),
                  maximumSize: Size(Screenwidth * 0.8, Screenheight * 0.06),
                  backgroundColor: Colors.deepPurple,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Upload Resume',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
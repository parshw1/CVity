import 'package:flutter/material.dart';
import 'package:cvity/auth/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  TextEditingController deletecurrentPasswordController = TextEditingController();
  TextEditingController deleteemailController = TextEditingController();

  void deleteAccountuser() async {
     context.read<FirebaseAuthMethods>().deleteAccount(context:context, password: deletecurrentPasswordController.text, email: deleteemailController.text); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: deletecurrentPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: deleteemailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Are you sure you want to delete your account?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                deleteAccountuser();
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text(
                'Delete Account',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
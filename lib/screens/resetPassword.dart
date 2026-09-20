import 'package:flutter/material.dart';
import 'package:cvity/auth/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
              
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () async {
                await context.read<FirebaseAuthMethods>().updatePassword(
                  newPassword: passwordController.text,
                  context: context,
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
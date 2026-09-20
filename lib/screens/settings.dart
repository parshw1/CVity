import 'package:cvity/screens/Login.dart';
import 'package:cvity/screens/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cvity/auth/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  
  SettingsPage({super.key,});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '[username]',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '[email]',
              ),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Change Username'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Build in progress!'),
                      duration: Duration(seconds: 1),
                    ),
                  ); 
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text('Reset Password'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resetpassword()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.upload_file),
                title: Text('Upload Avatar'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Build in progress!'),
                      duration: Duration(seconds: 1),
                    ),
                  ); 
                },
              ),
              ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete Account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  await context.read<FirebaseAuthMethods>().deleteAccount(context: context);
                },
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () async {
                  await context.read<FirebaseAuthMethods>().logout();
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
                  'Logout',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
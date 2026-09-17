import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  
  SettingsPage({super.key,});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
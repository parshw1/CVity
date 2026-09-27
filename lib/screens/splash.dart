import 'dart:async';

import 'package:cvity/screens/signUpPage.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1200),
          reverseTransitionDuration: const Duration(milliseconds: 1200),
          pageBuilder: (context, animation, secondaryAnimation) {
            return const SignUpPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Screenwidth = MediaQuery.of(context).size.width;
    final Screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Hero(
        tag: 'background',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CVity',
                  style: TextStyle(
                    fontFamily: "ChangaOne",
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 183, 144, 250),
                    shadows: [Shadow(color: Colors.white, blurRadius: 200)],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

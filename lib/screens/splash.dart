import 'dart:async';

import 'package:cvity/screens/Login.dart';
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
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => const Login()));
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, const Color.fromARGB(255, 183, 144, 250)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_box_outlined,
                  color: Colors.white,
                  size: 90,
                ),
                const SizedBox(height: 20),
                const Text(
                  'CVity',
                  style: TextStyle(
                    fontFamily: "ChangaOne",
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
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

import 'package:flutter/material.dart';

class Scaffoldbackground extends StatelessWidget {
  final Widget widget;
  const Scaffoldbackground({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 65, 60, 60),
            Color.fromARGB(255, 0, 0, 0),
          ],
        ),
      ),
      child: widget,
    );
  }
}

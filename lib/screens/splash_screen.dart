import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dart:async';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, MainScreen.routeName);
    });
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Image.asset(
          "assets/images/splash.png",
        ),
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:warranty_garage/screen/authenticationScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => authenticationScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(251, 127, 158, 143),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          child: Image.asset('lib/image/splashrmbg.png'),
        ),
      ),
    );
  }
}

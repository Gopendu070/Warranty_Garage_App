import 'dart:async';
import 'package:flutter/material.dart';
import 'package:warranty_garage/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 183, 247),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Image.asset('lib/image/iconApp.png'),
        ),
      ),
    );
  }
}

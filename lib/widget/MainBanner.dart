import 'package:flutter/material.dart';

class MainBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //c1
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(175, 94, 148, 141),
            Color.fromARGB(255, 2, 48, 42)
          ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WARRANTY',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
          Text(
            'GARAGE',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

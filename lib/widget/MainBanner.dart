import 'package:flutter/material.dart';

class MainBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //c1
      width: double.infinity,
      height: 200,

      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 209, 46, 238),
            Color.fromARGB(255, 10, 122, 214)
          ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
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

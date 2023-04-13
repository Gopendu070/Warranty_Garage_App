import 'package:flutter/material.dart';

class imageViewScreen extends StatelessWidget {
  String imgUrl;
  String name;
  imageViewScreen({required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 30, 42, 49),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.network(imgUrl),
      ),
    );
  }
}

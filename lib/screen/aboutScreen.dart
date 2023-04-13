import 'package:flutter/material.dart';
import 'package:warranty_garage/widget/TagWidg.dart';

class aboutWidget extends StatelessWidget {
  String about =
      "Warranty garage is the appropriation of a product management webpage providing solutions for the warranty reminder system to include and present the essential associations with different warranty marketering. Improving the projection of all the warranty at one place disassembling and removing the need for visiting different sites. Futher on it emphasises on less work management and easier system access. This website exempts the need of unneccessary work and display all the relevant data at singular enviroment. warranty Garage includes all the requirements for remembering and displaying the neccessary details as well as it concludes the warranty lose and failure once and for all.";
  String TnC =
      "In a contract of sale, parties may make certain statements about the stipulation or the course of trade. These stipulations in the contract of sale are made with reference to the subject matter of the sale. These stipulations may either be a condition or in the form of a warranty.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 182, 182),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 42, 49),
        title: Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              child: Text(
                about,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 85,
            ),
            Container(
              child: TagWidg(' Terms & Conditions :'),
            ),
            Container(
              width: 350,
              child: Text(
                TnC,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

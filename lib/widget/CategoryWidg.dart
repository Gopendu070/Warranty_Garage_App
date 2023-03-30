import 'package:flutter/material.dart';

class CategoryWidg extends StatelessWidget {
  var name = "";
  final Color colorr;
  CategoryWidg({required this.name, required this.colorr});
//This widhet will contain different categories
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 180,
          width: 180,
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          decoration: BoxDecoration(
            color: colorr,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(offset: Offset(2, 1), color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

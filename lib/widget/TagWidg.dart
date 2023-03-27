import 'package:flutter/material.dart';

class TagWidg extends StatelessWidget {
  var tag = "";
  TagWidg(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      child: Text(
        tag,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 142, 142, 142)),
        textAlign: TextAlign.left,
      ),
    );
  }
}

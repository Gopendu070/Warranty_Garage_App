import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 210,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            width: double.infinity,
            color: Colors.deepPurple,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/image/usericon.png'),
                  maxRadius: 35,
                ),
                Text(
                  'User',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

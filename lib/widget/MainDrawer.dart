import 'package:flutter/material.dart';
import 'package:warranty_garage/main.dart';
import 'package:warranty_garage/screen/aboutScreen.dart';

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
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.info_outline_rounded),
                  title: Text('About'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => aboutWidget()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

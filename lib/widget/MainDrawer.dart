import 'package:flutter/material.dart';
import 'package:warranty_garage/main.dart';
import 'package:warranty_garage/screen/aboutScreen.dart';
import 'package:warranty_garage/screen/authenticationScreen.dart';

class MainDrawer extends StatelessWidget {
  String userName;
  MainDrawer({required this.userName});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 210,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            width: double.infinity,
            color: Color.fromARGB(228, 55, 96, 90),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('lib/image/usericon.png'),
                  maxRadius: 35,
                ),
                Text(
                  userName,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(userName: userName)));
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
                ListTile(
                  leading: Icon(Icons.message_rounded),
                  title: Text('Send Feedback'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text('Logout'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Securely logged out'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color.fromARGB(200, 245, 58, 58),
                    ));
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => authenticationScreen()));
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

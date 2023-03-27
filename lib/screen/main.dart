import 'package:flutter/material.dart';
import 'package:warranty_garage/CategoryWidg.dart';
import 'package:warranty_garage/MainBanner.dart';
import 'package:warranty_garage/MainDrawer.dart';
import 'package:warranty_garage/TagWidg.dart';

void main() {
  runApp(const MyWarrantyApp());
}

class MyWarrantyApp extends StatelessWidget {
  const MyWarrantyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warranty Garage',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Info'),
        actions: [
          IconButton(
              onPressed: () {
                print('Searched..');
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: MainDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            //sec1=> contains the main banner of the app's home screen
            Flexible(child: MainBanner()),
            //sec2=> title of sec3
            TagWidg("CATEGORIES"),
            //sec3=> a scrollable row of widgets(categories)
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryWidg(
                        name: "Electronics",
                        colorr: Color.fromARGB(255, 255, 201, 7)),
                    CategoryWidg(
                      name: "Pharma",
                      colorr: Color.fromARGB(255, 98, 214, 179),
                    ),
                    CategoryWidg(
                      name: "Grocery",
                      colorr: Colors.green,
                    ),
                    CategoryWidg(
                      name: "Cosmetics",
                      colorr: Color.fromARGB(255, 249, 51, 186),
                    ),
                  ],
                ),
              ),
            ),
            //sec3=> title of sec4
            TagWidg("EXPIRING SOON")
            //sec4=> list of items which are 'Expiring Soon'
          ],
        ),
      ),
    );
  }
}

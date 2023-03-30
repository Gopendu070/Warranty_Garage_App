import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warranty_garage/screen/categoryScreen.dart';
import 'package:warranty_garage/widget/CategoryWidg.dart';
import 'package:warranty_garage/widget/MainBanner.dart';
import 'package:warranty_garage/widget/MainDrawer.dart';
import 'package:warranty_garage/widget/TagWidg.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<String> CategoryArr = [
    'Electronics',
    'Pharma',
    'Grocery',
    'Cosmetics',
    'Others'
  ];
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
                    //Electronics
                    InkWell(
                      child: CategoryWidg(
                        name: CategoryArr[0],
                        colorr: Color.fromARGB(255, 255, 201, 7),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(Title: CategoryArr[0])));
                      },
                    ),
                    //Pharma
                    InkWell(
                      child: CategoryWidg(
                        name: CategoryArr[1],
                        colorr: Color.fromARGB(255, 98, 214, 179),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(Title: CategoryArr[1])));
                      },
                    ),
                    //Grocery
                    InkWell(
                      child: CategoryWidg(
                        name: CategoryArr[2],
                        colorr: Colors.green,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(Title: CategoryArr[2])));
                      },
                    ),
                    //Cosmetics
                    InkWell(
                      child: CategoryWidg(
                        name: CategoryArr[3],
                        colorr: Color.fromARGB(255, 249, 51, 186),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(Title: CategoryArr[3])));
                      },
                    ),
                    //Others
                    InkWell(
                      child: CategoryWidg(
                        name: CategoryArr[4],
                        colorr: Color.fromARGB(255, 252, 234, 33),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryScreen(Title: CategoryArr[4])));
                      },
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

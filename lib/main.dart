import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warranty_garage/screen/SplashScreen.dart';
import 'package:warranty_garage/screen/categoryScreen.dart';
import 'package:warranty_garage/widget/CategoryWidg.dart';
import 'package:warranty_garage/widget/MainBanner.dart';
import 'package:warranty_garage/widget/MainDrawer.dart';
import 'package:warranty_garage/widget/TagWidg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:warranty_garage/widget/animatedLIST.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      home: SplashScreen(),
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
  List<Color> colorArr = [
    Color.fromARGB(255, 255, 201, 7),
    Color.fromARGB(255, 98, 214, 179),
    Color.fromARGB(229, 117, 211, 120),
    Color.fromARGB(255, 240, 136, 207),
    Color.fromARGB(255, 252, 234, 33),
  ];
  var DBRef = FirebaseDatabase.instance.ref('dataBase');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User Info'),
        actions: [Icon(Icons.verified_user_outlined)],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          //sec1=> contains the main banner of the app's home screen
          MainBanner(),
          //sec2=> title of sec3
          TagWidg("CATEGORIES"),
          //sec3=> a scrollable row of widgets(categories)

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //Electronics
                InkWell(
                  child: CategoryWidg(
                    name: CategoryArr[0],
                    colorr: colorArr[0],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  colorr: colorArr[0],
                                  category: CategoryArr[0],
                                  dbRef: DBRef,
                                )));
                  },
                ),
                //Pharma
                InkWell(
                  child: CategoryWidg(
                    name: CategoryArr[1],
                    colorr: colorArr[1],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  colorr: colorArr[1],
                                  category: CategoryArr[1],
                                  dbRef: DBRef,
                                )));
                  },
                ),
                //Grocery
                InkWell(
                  child: CategoryWidg(
                    name: CategoryArr[2],
                    colorr: colorArr[2],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  colorr: colorArr[2],
                                  category: CategoryArr[2],
                                  dbRef: DBRef,
                                )));
                  },
                ),
                //Cosmetics
                InkWell(
                  child: CategoryWidg(
                    name: CategoryArr[3],
                    colorr: colorArr[3],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  colorr: colorArr[3],
                                  category: CategoryArr[3],
                                  dbRef: DBRef,
                                )));
                  },
                ),
                //Others
                InkWell(
                  child: CategoryWidg(
                    name: CategoryArr[4],
                    colorr: colorArr[4],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                                  colorr: colorArr[4],
                                  category: CategoryArr[4],
                                  dbRef: DBRef,
                                )));
                  },
                ),
              ],
            ),
          ),
          //sec3=> title of sec4
          TagWidg("YOUR ITEMS"),
          //sec4=>
          Container(
            width: screenWidth,
            height: 214,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: 155,
                    child: Column(children: [
                      Expanded(
                        child: animatedLIST(
                            category: CategoryArr[0],
                            dbRef: DBRef,
                            colorr: colorArr[0]),
                      )
                    ]),
                  ),
                  Container(
                    height: 26,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: screenWidth,
                    height: 155,
                    child: Column(children: [
                      Expanded(
                          child: animatedLIST(
                              category: CategoryArr[1],
                              dbRef: DBRef,
                              colorr: colorArr[1]))
                    ]),
                  ),
                  Container(
                    height: 26,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: screenWidth,
                    height: 155,
                    child: Column(children: [
                      Expanded(
                          child: animatedLIST(
                              category: CategoryArr[2],
                              dbRef: DBRef,
                              colorr: colorArr[2]))
                    ]),
                  ),
                  Container(
                    height: 26,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: screenWidth,
                    height: 155,
                    child: Column(children: [
                      Expanded(
                          child: animatedLIST(
                              category: CategoryArr[3],
                              dbRef: DBRef,
                              colorr: colorArr[3]))
                    ]),
                  ),
                  Container(
                    height: 26,
                    color: Colors.grey[300],
                  ),
                  Container(
                    width: screenWidth,
                    height: 155,
                    child: Column(children: [
                      Expanded(
                          child: animatedLIST(
                              category: CategoryArr[4],
                              dbRef: DBRef,
                              colorr: colorArr[4]))
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

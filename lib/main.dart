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
  runApp(MyWarrantyApp());
}

class MyWarrantyApp extends StatelessWidget {
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
    'Vehicle',
    'Pharma',
    'Grocery',
    'Toiletries',
    'Others'
  ];
  List<LinearGradient> gradientsArr = [
    //0
    LinearGradient(colors: [
      Color.fromARGB(255, 123, 16, 181),
      Color.fromARGB(130, 176, 166, 177),
    ]),
    //1
    LinearGradient(colors: [
      Color.fromARGB(130, 176, 166, 177),
      Color.fromARGB(255, 5, 75, 131),
    ]),
    //2
    LinearGradient(colors: [
      Color.fromARGB(255, 123, 16, 181),
      Color.fromARGB(130, 176, 166, 177),
    ]),
    //3
    LinearGradient(colors: [
      Color.fromARGB(130, 176, 166, 177),
      Color.fromARGB(255, 5, 75, 131),
    ]),
    //4
    LinearGradient(colors: [
      Color.fromARGB(255, 123, 16, 181),
      Color.fromARGB(130, 176, 166, 177),
    ]),
    //5
    LinearGradient(colors: [
      Color.fromARGB(130, 176, 166, 177),
      Color.fromARGB(255, 5, 75, 131),
    ]),
  ];

  List<Color> colorArr = [
    Color.fromARGB(255, 255, 201, 7),
    Color.fromARGB(255, 98, 214, 179),
    Color.fromARGB(229, 117, 211, 120),
    Color.fromARGB(255, 240, 136, 207),
    Color.fromARGB(255, 252, 234, 33),
    Color.fromARGB(255, 252, 234, 33),
  ];
  var DBRef = FirebaseDatabase.instance.ref('dataBase');

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 180, 186, 198),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 123, 16, 181),
          centerTitle: true,
          // title: Text('User Info'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: CircleAvatar(
                radius: 18.5, // Set the radius of the circl
                backgroundImage:
                    AssetImage('lib/image/iconAppBG.png'), // Set the image
              ),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              //sec1=> contains the main banner of the app's home screen
              MainBanner(),
              //sec2=> title of sec3
              TagWidg("CATEGORIES"),
              //sec3=> a scrollable row of widgets(categories)

              Flexible(
                flex: 2,
                child: Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        //Electronics
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[0],
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
                        //Vehicle
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[1],
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
                        //Pharma
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[2],
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
                        //Grocery
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[3],
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
                        //Toiletries
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[4],
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
                        //Others
                        InkWell(
                          child: CategoryWidg(
                            gradientColor: gradientsArr[5],
                            name: CategoryArr[5],
                            colorr: colorArr[5],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryScreen(
                                          colorr: colorArr[5],
                                          category: CategoryArr[5],
                                          dbRef: DBRef,
                                        )));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //sec3=> title of sec4
              TagWidg("YOUR ITEMS"),
              //sec4=> Scrollable Item List
              Flexible(
                flex: 3,
                child: Container(
                  width: screenWidth,
                  height: 270,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    thickness: 7,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth,
                            height: 155,
                            child: Column(children: [
                              //0
                              Container(
                                child: Center(child: Text(CategoryArr[0])),
                                height: 26,
                                color: Color.fromARGB(255, 197, 184, 200),
                              ),
                              Expanded(
                                child: animatedLIST(
                                    category: CategoryArr[0],
                                    dbRef: DBRef,
                                    colorr: colorArr[0]),
                              )
                            ]),
                          ),
                          //1
                          Container(
                            child: Center(child: Text(CategoryArr[1])),
                            height: 26,
                            color: Color.fromARGB(255, 197, 184, 200),
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
                          //2
                          Container(
                            child: Center(child: Text(CategoryArr[2])),
                            height: 26,
                            color: Color.fromARGB(255, 197, 184, 200),
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
                          //3
                          Container(
                            child: Center(child: Text(CategoryArr[3])),
                            height: 26,
                            color: Color.fromARGB(255, 197, 184, 200),
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
                          //4
                          Container(
                            child: Center(child: Text(CategoryArr[4])),
                            height: 26,
                            color: Color.fromARGB(255, 197, 184, 200),
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
                          //5
                          Container(
                            child: Center(child: Text(CategoryArr[5])),
                            height: 26,
                            color: Color.fromARGB(255, 197, 184, 200),
                          ),
                          Container(
                            width: screenWidth,
                            height: 155,
                            child: Column(children: [
                              Expanded(
                                  child: animatedLIST(
                                      category: CategoryArr[5],
                                      dbRef: DBRef,
                                      colorr: colorArr[5]))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

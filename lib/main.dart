import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

import 'notification/notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyWarrantyApp());
}

class MyWarrantyApp extends StatelessWidget {
  final MaterialColor myColor = MaterialColor(
    0xFF212121,
    <int, Color>{
      50: Color(0xD7B9B),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFEEEEEE),
      300: Color(0xFFE0E0E0),
      400: Color(0xFFBDBDBD),
      500: Color(0xFF9E9E9E),
      600: Color(0xFF757575),
      700: Color(0xFF616161),
      800: Color(0xFF424243),
      900: Color(0xFF212121),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warranty Garage',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String userName;
  MyHomePage({required this.userName});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  void initstate() {
    super.initState();
    /* 1. This method call when app in TERMINATED state and you get a notification
      when you click on notification app open from terminated state and you can get notification data in this method */

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
          }
        }
      },
    );
    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

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
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
    ]),
    //1
    LinearGradient(colors: [
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
    ]),
    //2
    LinearGradient(colors: [
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
    ]),
    //3
    LinearGradient(colors: [
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
    ]),
    //4
    LinearGradient(colors: [
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
    ]),
    //5
    LinearGradient(colors: [
      Color.fromARGB(255, 143, 140, 144),
      Color.fromARGB(255, 143, 140, 144),
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
          backgroundColor: Color.fromARGB(228, 55, 96, 90),
          centerTitle: true,
          // title: Text('User Info'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: CircleAvatar(
                radius: 18.5, // Set the radius of the circl
                backgroundImage:
                    AssetImage('lib/image/newicon.png'), // Set the image
              ),
            ),
          ],
        ),
        drawer: MainDrawer(
          userName: widget.userName,
        ),
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
                  child: Scrollbar(
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
              ),

              //sec3=> title of sec4
              TagWidg("YOUR ITEMS"),
              //sec4=> Scrollable Item List
              Flexible(
                flex: 3,
                child: Container(
                  width: screenWidth,
                  height: 276,
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
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
                                color: Color.fromARGB(174, 81, 133, 126),
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
                            color: Color.fromARGB(174, 81, 133, 126),
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
                            color: Color.fromARGB(174, 81, 133, 126),
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
                            color: Color.fromARGB(174, 81, 133, 126),
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
                            color: Color.fromARGB(174, 81, 133, 126),
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
                            color: Color.fromARGB(174, 81, 133, 126),
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

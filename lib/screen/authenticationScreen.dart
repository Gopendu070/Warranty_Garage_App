import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:warranty_garage/main.dart';

class authenticationScreen extends StatefulWidget {
  const authenticationScreen({super.key});

  @override
  State<authenticationScreen> createState() => _authenticationScreenState();
}

class _authenticationScreenState extends State<authenticationScreen> {
  bool supportState = false;
  late final LocalAuthentication auth;
  bool isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState(() {
          supportState = isSupported;
        }));
  }

  @override
  Widget build(BuildContext context) {
    var userNameController = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 183, 177, 192),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 55, 96, 90),
        title: Text("Warranty Garage"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 320,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white30,
              Color.fromARGB(228, 55, 96, 90),
            ]),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (supportState)
                    Text(
                      '- Biometric Authentication -',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  else
                    Text('Biometric Authentication Unavailable!'),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () async {
                        String userName = userNameController.text.toString();
                        if (userName == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter Username'),
                              backgroundColor: Color.fromARGB(200, 245, 58, 58),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } else {
                          isAuthenticated = await authenticate();
                          if (isAuthenticated) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                          userName: userName,
                                        )));
                          }
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black54)),
                      child: Text('Authenticate'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //THis function will check and authenticate fingerprint
  Future<bool> authenticate() async {
    try {
      return await auth.authenticate(
        localizedReason: "Use screen lock fingerprint",
        options: AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }
}

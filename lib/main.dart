// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sparks/pages/dashboard.dart';
import 'package:sparks/pages/guest.dart';
import 'package:sparks/pages/login.dart';
import 'package:sparks/pages/signup.dart';
import 'package:sparks/widgets/bgimage.dart';
import 'package:sparks/widgets/widgets.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          //front page
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 440,
                        ),

                        //Login Button
                        MaterialButton(
                          minWidth: 200,
                          height: 50,
                          splashColor: Color.fromARGB(255, 178, 255, 174),
                          elevation: 10,
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  child: const Dashboard(
                                    token: '',
                                  ),
                                  type: PageTransitionType.fade),
                            );
                          },
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //Sign Up Button
                        MaterialButton(
                          minWidth: 190,
                          height: 50,
                          elevation: 10,
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: SignPage(),
                              ),
                            );
                          },
                          color: Color.fromARGB(255, 58, 208, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            'Sign  Up',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 25),
                          ),
                        ),

                        SizedBox(
                          height: 25,
                        ),

                        //Guest Mode
                        Container(
                          color: const Color.fromARGB(255, 69, 68, 68),
                          width: MediaQuery.of(context).size.width / 4,
                          padding: EdgeInsets.all(3),
                          child: RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: ' Guest Mode ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    Navigator.of(context).push(PageTransition(
                                        child: GuestMode(),
                                        type: PageTransitionType.fade));
                                  }),
                          ])),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

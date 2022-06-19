import 'dart:io';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sing_final/onboarding/onboared.dart';
import 'package:sing_final/routes.dart';
import 'package:sing_final/screens/category_screen.dart';
import 'package:sing_final/screens/start/start_screen.dart';
import 'package:sing_final/screens/starting_screen.dart';
import 'package:sing_final/services/py_model.dart';
import 'package:sing_final/start_screen_new.dart';
import 'package:sizer/sizer.dart';
Future<void> main() async {
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation,diviceType){
      return MaterialApp(
             title: 'Adaptive Speech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
        splashIconSize: 250,
        splashTransition: SplashTransition.scaleTransition,
        duration: 4000,
        splash: Image.asset('assets/splash.png'),
        nextScreen: OnBoardScreen() // StartingTany() //MYSignModel()  //OnBoardScreen(),
      ),
      routes: routes,
      );
    });
    
  }
 }



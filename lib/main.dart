import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Icons.bluetooth,
            nextScreen: const MyHomePage(title: Icon(Icons.bluetooth)),
            splashTransition: SplashTransition.slideTransition,
            //pageTransitionType: PageTransitionType,
            backgroundColor: Colors.blue));
  }
}


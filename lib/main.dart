import 'package:flutter/material.dart';

import 'Pages/HomePage.dart';
import 'Pages/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'homePage': (context) => HomePage(),
      },
    );
  }
}

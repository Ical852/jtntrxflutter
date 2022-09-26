//@dart=2.9

import 'package:flutter/material.dart';
import 'package:jtntrx/pages/main.dart';
import 'package:jtntrx/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => SplashPage(),
        '/main' : (context) => MainPage()
      },
    );
  }
}

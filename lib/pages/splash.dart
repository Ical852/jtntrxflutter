import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jtntrx/shared/theme.dart';

class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();

}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, "/main");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 114,
                width: 65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/iclogo.png")
                  )
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "App Keuangan",
                style: robototext.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold,
                  color: white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
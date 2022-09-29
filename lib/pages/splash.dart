import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jtntrx/cubit/user_cubit.dart';
import 'package:jtntrx/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().login();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Timer(Duration(seconds: 2), () {
            Navigator.pushNamed(context, "/main");
          });
        }
      },
      builder: (context, state) {
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
                            image: AssetImage("assets/iclogo.png"))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "App Keuangan",
                    style: robototext.copyWith(
                        fontSize: 32, fontWeight: semiBold, color: white),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

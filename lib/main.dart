//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jtntrx/cubit/trx_cubit.dart';
import 'package:jtntrx/cubit/user_cubit.dart';
import 'package:jtntrx/pages/main.dart';
import 'package:jtntrx/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => TrxCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => SplashPage(),
          '/main' : (context) => MainPage()
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/screens/signUp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignupScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.orange, AppColors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
              child: Image.asset(
            "assets/KashInfo.Logo-removebg-preview.png",
          ))),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key, required this.onPressed, this.text, this.height, this.width});

  VoidCallback onPressed;
  String? text;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;
    return Container(
      height: height ?? deviceH * 0.1,
      width: width ?? deviceW * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: [AppColors.orange, AppColors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

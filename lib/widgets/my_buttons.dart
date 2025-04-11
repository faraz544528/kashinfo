// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    this.text,
  });

  VoidCallback onPressed;
  String? text;

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;
    return Container(
      height: deviceH * 0.1,
      width: deviceW * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(colors: [AppColors.orange, AppColors.pink])),
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

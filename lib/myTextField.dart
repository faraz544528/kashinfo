import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kashinfo/Mycolors.dart';

class Mytextfield extends StatelessWidget {
  Mytextfield({this.controller, this.hintText, this.width});

  TextEditingController? controller;
  String? hintText;
  double? width;

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: SizedBox(
        width: width,
        child: Card(
          elevation: 3,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.pink)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.orange))),
          ),
        ),
      ),
    );
  }
}

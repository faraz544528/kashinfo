// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kashinfo/constants/my_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.width,
    this.suffixIcon,
    this.filled,
    this.onTap,
    this.readOnly,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputAction,
    this.inputFormatters,
  });

  TextEditingController? controller;
  String? hintText;
  double? width;
  Widget? suffixIcon;
  bool? filled;
  GestureTapCallback? onTap;
  bool? readOnly;
  Widget? prefixIcon;
  bool obscureText;
  TextInputAction? textInputAction;
  List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: SizedBox(
        width: width ?? deviceW * 0.4,
        child: Card(
          elevation: 3,
          child: TextField(
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            obscureText: obscureText!,
            onTap: onTap,
            readOnly: readOnly ?? (onTap != null),
            controller: controller,
            decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                filled: filled,
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

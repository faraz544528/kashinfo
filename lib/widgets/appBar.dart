import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, this.child});

  Widget? child;

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;

    return AppBar(
      flexibleSpace: Container(
        width: double.infinity,
        height: deviceH * 0.1,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.orange, AppColors.pink],
                begin: Alignment.topLeft,
                end: Alignment.topRight)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: child ??
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image(
                      image: AssetImage(
                          "assets/KashInfo.Logo-removebg-preview.png")),
                ),
              ),
        ),
      ),
    );
  }
}

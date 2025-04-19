import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kashinfo/constants/my_colors.dart';

Widget userAvatar({
  required String? photoUrl,
  required File? selectedImage,
  required VoidCallback onPickImage,
}) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [AppColors.pink, AppColors.orange],
          ),
        ),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 85,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 80,
            child: photoUrl != null
                ? CircleAvatar(
                    backgroundColor: AppColors.orange,
                    radius: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        photoUrl,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : selectedImage == null
                    ? Icon(FontAwesomeIcons.userLarge,
                        size: 65, color: AppColors.pink)
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.file(
                          selectedImage,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
          ),
        ),
      ),
      Positioned(
        right: 5,
        bottom: 3,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [AppColors.pink, AppColors.orange],
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 25,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: IconButton(
                onPressed: onPickImage,
                icon: Icon(FontAwesomeIcons.camera),
              ),
            ),
          ),
        ),
      )
    ],
  );
}

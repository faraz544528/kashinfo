import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kashinfo/constants/my_colors.dart';

Widget userAvatar({
  required String? photoUrl,
  required Uint8List? selectedImageBytes, // 🔥 add this
  required VoidCallback onPickImage,
}) {
  return Stack(
    children: [
      Container(
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.orange,
          shape: BoxShape.circle,
        ),
        child: photoUrl != null &&
                photoUrl.isNotEmpty // ✅ Fixed empty string issue
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
            : selectedImageBytes !=
                    null // ✅ Cross-platform file image rendering
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.memory(
                      selectedImageBytes,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  )
                : Icon(
                    FontAwesomeIcons.userLarge,
                    size: 65,
                    color: AppColors.pink,
                  ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: InkWell(
          onTap: onPickImage,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.pink,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Icon(
              FontAwesomeIcons.pen,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    ],
  );
}

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/screens/signUp_screen.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/user_avatar.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  bool sendSales = true;
  Uint8List? selectedProviderImage;
  uploadImage() async {
    var imagePicked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      final bytes = await imagePicked.readAsBytes();
      setState(() {
        selectedProviderImage = bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;

    return Scaffold(
        appBar: AppBar(
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Image(
                      image: AssetImage(
                          "assets/KashInfo.Logo-removebg-preview.png")),
                ),
              ),
            ),
          ),
        ),
        body: sendSales
            ? Center(
                child: CustomButton(
                  onPressed: () {
                    setState(() {
                      sendSales = false;
                    });
                  },
                  text: "Send Sales",
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 550),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              sendSales = true;
                            });
                          },
                          icon: Icon(Icons.close)),
                    ),
                    Card(
                      elevation: 4,
                      child: Container(
                        height: deviceH * 0.3,
                        width: deviceW * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [AppColors.orange, AppColors.pink],
                                begin: Alignment.topLeft,
                                end: Alignment.topRight)),
                        child: userAvatar(
                            photoUrl: null,
                            selectedImageBytes: selectedProviderImage,
                            onPickImage: uploadImage),
                      ),
                    ),
                    SizedBox(
                      height: deviceH * 0.04,
                    ),
                    CustomButton(
                      onPressed: () {
                        if (selectedProviderImage == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("select the image")));
                        }
                      },
                      text: "Upload",
                    )
                  ],
                ),
              ));
  }
}

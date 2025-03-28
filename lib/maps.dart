import 'package:flutter/material.dart';
import 'package:kashinfo/myTextField.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Mytextfield(
              hintText: "Name",
              controller: nameController,
            ),
            Mytextfield(hintText: "Contact", controller: contactController),
          ],
        ),
      ),
    );
  }
}

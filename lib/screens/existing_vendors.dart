import 'package:flutter/material.dart';
import 'package:kashinfo/data/controllers.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Existing vendors")),
      body: Column(
        children: [
          Text(serviceNameController.text),
          Text(vendorNameController.text),
          Text(vendorAdrressController.text),
          Text(vendorContactController.text),
          Text(whatsappNumberController.text),
          Text(categoryController.text),
        ],
      ),
    );
  }
}

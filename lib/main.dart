import 'package:flutter/material.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: AddVendorScreen(),
    );
  }
}










// For Button Add Text isWhatsApp?
// For Categories Use DropDown Instead of TextF
// Better Styling, Sizing, Spacing
// Use DatePicker For Avlb Timings
// Make all field mandatory
// check for duplicate entry on name and email and phone number
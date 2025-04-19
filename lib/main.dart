import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kashinfo/firebase_options.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/screens/homescreen.dart';
import 'package:kashinfo/screens/login_screen.dart';
import 'package:kashinfo/screens/signUp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
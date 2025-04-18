import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/screens/existing_vendors.dart';
import 'package:kashinfo/widgets/my_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "Other Category";

  List<Map<String, String>> vendors =
      []; //map to store vendor data inside a list

  @override
  Widget build(BuildContext context) {
    double deviceH = MediaQuery.sizeOf(context).height;
    double deviceW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width: double.infinity,
          height: deviceH * 0.12,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.orange, AppColors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.person_add),
                ),
                SizedBox(width: deviceW * 0.37),
                Text("KashInfo - Admin Panel",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            CustomButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddVendorScreen()));
              },
              text: "Add Vendor",
            ),
            SizedBox(height: deviceH * 0.04),
            CustomButton(
              onPressed: () {},
              text: "Update Existing",
            ),
            SizedBox(height: deviceH * 0.04),
            CustomButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExistingVendors(vendors: vendors)));
              },
              text: "Existing Vendors",
            )
          ],
        )),
      ),
    );
  }
}

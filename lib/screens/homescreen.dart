import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/screens/existing_vendors.dart';
import 'package:kashinfo/screens/provider_screen.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              height: deviceH * 0.4,
              width: deviceW * 0.15,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AddVendorScreen()));
              },
              text: "Add Vendor",
            ),
            SizedBox(width: deviceW * 0.04),
            CustomButton(
              height: deviceH * 0.4,
              width: deviceW * 0.15,
              onPressed: () {},
              text: "Update Existing",
            ),
            SizedBox(width: deviceW * 0.04),
            CustomButton(
              height: deviceH * 0.4,
              width: deviceW * 0.15,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ExistingVendors()));
              },
              text: "Existing Vendors",
            ),
            SizedBox(width: deviceW * 0.04),
            CustomButton(
              height: deviceH * 0.4,
              width: deviceW * 0.15,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("You Are redirected to provider App")));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderScreen()));
              },
              text: "Provider App",
            ),
          ],
        ),
      ),
    );
  }
}

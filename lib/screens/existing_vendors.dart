import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class ExistingVendors extends StatefulWidget {
  final List<Map<String, String>> vendors;
  const ExistingVendors({super.key, required this.vendors});

  @override
  State<ExistingVendors> createState() => _ExistingVendorsState();
}

class _ExistingVendorsState extends State<ExistingVendors> {
  String? firstName;
  String? lastName;
  String? image;
  Future<void> fetchDetails() async {
    var data = await http.get(Uri.parse("https://reqres.in/api/users"));
    var decoder = jsonDecode(data.body);
    setState(() {
      firstName = "FirstName: ${decoder["data"][0]["first_name"]}";
      lastName = "LastName: ${decoder["data"][0]["last_name"]}";
      image = decoder["data"][0]["avatar"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Existing vendors")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: fetchDetails,
              text: "HIT API",
            ),
            if (firstName != null && lastName != null && image != null)
              Container(
                height: 100,
                width: 200,
                color: Colors.grey,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(image!),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("$firstName \n$lastName"),
                  ],
                ),
              )
          ],
        ),
      ),

      // body: ListView.builder(
      //   itemCount: widget.vendors.length,
      //   itemBuilder: (context, index) {
      //     final vendor = widget.vendors[index];
      //     return ListTile(
      //       leading: Image(image: NetworkImage(vendor['Image URL'] ?? "")),
      //       title: Text(vendor['Vendor Name'] ?? ""),
      //       subtitle: Text(vendor['Email'] ?? ""),
      //     );
      //  },
    );
  }
}

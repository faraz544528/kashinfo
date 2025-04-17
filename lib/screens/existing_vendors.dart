import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class ExistingVendors extends StatefulWidget {
  final List<Map<String, String>> vendors;
  ExistingVendors({super.key, required this.vendors});

  @override
  State<ExistingVendors> createState() => _ExistingVendorsState();
}

class _ExistingVendorsState extends State<ExistingVendors> {
  String? firstName;
  String? lastName;
  String? image;
  List<Map<String, dynamic>> push = [];
  Future<void> fetchDetails() async {
    var data = await http.get(Uri.parse("https://reqres.in/api/users"));
    var decoder = jsonDecode(data.body);

    setState(() {
      decoder["data"].forEach((element) {
        push.add(element);
        // print(push);
      });

      // firstName = "FirstName: ${decoder["data"][0]["first_name"]}";
      // lastName = "LastName: ${decoder["data"][0]["last_name"]}";
      // image = ["data"][0]["avatar"];
    });
  }

  void initState() {
    super.initState();
    fetchDetails();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text("Existing vendors")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (push.length > 0)
              Card(
                  elevation: 4,
                  child: SizedBox(
                    height: 300,
                    width: 500,
                    child: ListView.builder(
                        itemCount: push.length,
                        itemBuilder: (context, index) {
                          final pushValue = push[index];
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                                height: 100,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: LinearGradient(colors: [
                                      AppColors.orange,
                                      AppColors.pink
                                    ])),
                                child: ListTile(
                                  leading: Image(
                                      image: NetworkImage(
                                          pushValue['avatar'] ?? "")),
                                  title: Text(pushValue['first_name'] ?? ""),
                                  subtitle: Text(pushValue['email'] ?? ""),
                                )),
                          );
                        }),
                  )),
          ],
        ),
      ),
    );
  }
}

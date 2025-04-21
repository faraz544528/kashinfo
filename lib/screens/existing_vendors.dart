import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kashinfo/constants/my_colors.dart';

class ExistingVendors extends StatefulWidget {
  ExistingVendors({super.key});

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
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Existing vendors")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (push.isNotEmpty)
                Card(
                    color: Colors.white,
                    elevation: 4,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height - 20,
                      width: MediaQuery.sizeOf(context).width - 250,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kashinfo/data/controllers.dart';

class ExistingVendors extends StatefulWidget {
  final List<Map<String, String>> vendors;
  const ExistingVendors({super.key, required this.vendors});

  @override
  State<ExistingVendors> createState() => _ExistingVendorsState();
}

class _ExistingVendorsState extends State<ExistingVendors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Existing vendors")),
        body: ListView.builder(
          itemCount: widget.vendors.length,
          itemBuilder: (context, index) {
            final vendor = widget.vendors[index];
            return ListTile(
              leading: Image(image: NetworkImage(vendor['Image URL'] ?? "")),
              title: Text(vendor['Vendor Name'] ?? ""),
              subtitle: Text(vendor['Email'] ?? ""),
            );
          },
        ));
  }
}

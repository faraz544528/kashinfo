import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class AddVendorScreen extends StatefulWidget {
  const AddVendorScreen({super.key});

  @override
  State<AddVendorScreen> createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends State<AddVendorScreen> {
  bool isChecked = true;
  bool showForm = false;
  List<Map<String, String>> vendors =
      []; //map to store vendor data inside a list
// Controllers for input fields

  void saveVendor() {
    //function to save vendor data
    String serviceName = serviceNameController.text.trim();
    String vendorName = vendorNameController.text.trim();
    String vendorAdrress = vendorAdrressController.text.trim();
    String vendorContact = vendorContactController.text.trim();
    String whatsappNumber = whatsappNumberController.text.trim();
    String category = categoryController.text.trim();
    String email = emailController.text.trim();
    String availableTimings = availableTimingsController.text.trim();
    // if (vendors.contains(vendorName)) {
    //   // check weather vendor is new or existing
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text("Vendor already exists!")));
    //   return;
    // }
    bool vendorExists =
        vendors.any((vendor) => vendor["Vendor Name"] == vendorName);
    if (vendorExists) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Vendor already Exists")));
      return;
    }

    setState(() {
      vendors.add({
        // save vendor data in map
        'Service Name': serviceName,
        'Vendor Name': vendorName,
        'Vendor Address': vendorAdrress,
        'Vendor Contact': vendorContact,
        'WhatsApp Number': whatsappNumber,
        'Category': category,
        'Email': email,
        'Availaible Timings': availableTimings,
      });
      // clear after saving data
      serviceNameController.clear();
      vendorNameController.clear();
      vendorAdrressController.clear();
      vendorContactController.clear();
      whatsappNumberController.clear();
      categoryController.clear();
      emailController.clear();
      availableTimingsController.clear();
      isChecked = true;
      showForm = false;
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Vendor Added successfully")));
  }

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
                Text("KashInfo Add Vendor",
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
              showForm
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                            hintText: "Service Name",
                            controller: serviceNameController),
                        CustomTextField(
                            hintText: "Vendor Name",
                            controller: vendorNameController),
                        CustomTextField(
                            hintText: "Vendor Address",
                            controller: vendorAdrressController),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextField(
                                hintText: "Vendor Contact",
                                controller: vendorContactController),
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            )
                          ],
                        ),
                        if (!isChecked)
                          CustomTextField(
                            hintText: "WhatsApp Number",
                            controller: whatsappNumberController,
                          ),
                        CustomTextField(
                            hintText: "Category",
                            controller: categoryController),
                        CustomTextField(
                            hintText: "Email", controller: emailController),
                        CustomTextField(
                            hintText: "Available Timings",
                            controller: availableTimingsController),
                        CustomButton(
                          onPressed: saveVendor,
                          text: "Save Vendor",
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            setState(() {
                              showForm = true;
                            });
                          },
                          text: "Add Vendor",
                        ),
                        SizedBox(height: deviceH * 0.04),
                        CustomButton(
                          onPressed: () {},
                          text: "Update Existing",
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

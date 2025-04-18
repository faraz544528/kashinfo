import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kashinfo/constants/my_colors.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/screens/existing_vendors.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class AddVendorScreen extends StatefulWidget {
  const AddVendorScreen({super.key});

  @override
  State<AddVendorScreen> createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends State<AddVendorScreen> {
  String selectedCategory = "Other Category";
  bool isChecked = true;
  bool showForm = false;

  List<Map<String, String>> vendors =
      []; //map to store vendor data inside a list
// Controllers for input fields

  Future<void> addVendor(
      String vendorType, Map<String, dynamic> vendorData) async {
    await FirebaseFirestore.instance
        .collection(vendorType)
        // .doc(vendorId)
        // .collection('medics')
        .add(vendorData);
  }

  void saveVendor() {
    //function to save vendor data
    String imageURL = vendorImageController.text.trim();
    String serviceName = serviceNameController.text.trim();
    String vendorName = vendorNameController.text.trim();
    String vendorAdrress = vendorAdrressController.text.trim();
    String vendorContact = vendorContactController.text.trim();
    String whatsappNumber = whatsappNumberController.text.trim();
    String dropDownCategory = selectedCategory;
    String category = categoryController.text.trim();
    String email = emailController.text.trim();
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();

    if (serviceName.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("service name is required! ")));
      return;
    } else if (vendorName.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Vendor Name is required! ")));
      return;
    } else if (vendorAdrress.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Vendor Address is required! ")));
      return;
    } else if (vendorContact.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Vendor Contact is required! ")));
      return;
    } else if (category.isEmpty && selectedCategory == "Other Category") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Category is required")));
      return;
    } else if (isChecked == false && whatsappNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Whatsapp Number is required! ")));
      return;
    } else if (email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Email is required! ")));
      return;
    } else if (startDate.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Start Date is required! ")));
      return;
    } else if (endDate.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("End Date is required! ")));
      return;
    }
    bool vendorExists = vendors.any((vendor) =>
        vendor["Vendor Name"] == vendorName ||
        vendor["Vendor Contact"] == vendorContact ||
        vendor["Email"] == email);
    if (vendorExists) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Vendor already Exists")));
      return;
    }

    setState(() {
      vendors.add({
        // save vendor data in map
        'Image URL': imageURL,
        'Service Name': serviceName,
        'Vendor Name': vendorName,
        'Vendor Address': vendorAdrress,
        'Vendor Contact': vendorContact,
        'WhatsApp Number': whatsappNumber,
        'DropDown Categoery': dropDownCategory,
        'Category': category,
        'Email': email,
        'Start Date': startDate,
        'End Date': endDate
      });

      // clear after saving data
      vendorImageController.clear();
      serviceNameController.clear();
      vendorNameController.clear();
      vendorAdrressController.clear();
      vendorContactController.clear();
      whatsappNumberController.clear();
      categoryController.clear();
      emailController.clear();
      startDateController.clear();
      endDateController.clear();
      isChecked = true;
      showForm = false;
      selectedCategory = "Other Category";

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Vendor Added successfully")));
    });
  }

  Future<void> selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      controller.text =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, "0")}-${pickedDate.day.toString().padLeft(2, "0")}";
    }
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              hintText: "Image URL",
              controller: vendorImageController,
            ),
            CustomTextField(
                hintText: "Service Name", controller: serviceNameController),
            CustomTextField(
                hintText: "Vendor Name", controller: vendorNameController),
            CustomTextField(
                hintText: "Vendor Address",
                controller: vendorAdrressController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: CustomTextField(
                      hintText: "Vendor Contact",
                      controller: vendorContactController),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text("Is Whatsapp")
              ],
            ),
            if (!isChecked)
              CustomTextField(
                hintText: "WhatsApp Number",
                controller: whatsappNumberController,
              ),
            Container(
              width: deviceW * 0.2,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.pink),
                  borderRadius: BorderRadius.circular(12)),
              child: DropdownButton(
                icon: Icon(Icons.arrow_downward_outlined),
                underline: SizedBox.shrink(),
                isExpanded: true,
                items: [
                  DropdownMenuItem(
                      value: "Other Category", child: Text("Other Category")),
                  DropdownMenuItem(value: "Travel", child: Text("Travel")),
                  DropdownMenuItem(value: "grocery", child: Text("grocery")),
                  DropdownMenuItem(value: "medicine", child: Text("medicine")),
                  DropdownMenuItem(value: "Shopping", child: Text("Shopping")),
                  DropdownMenuItem(value: "Service", child: Text("Service"))
                ],
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {});
                  selectedCategory = value!;
                },
              ),
            ),
            CustomTextField(
                hintText: "Category", controller: categoryController),
            CustomTextField(hintText: "Email", controller: emailController),
            CustomTextField(
                onTap: () {
                  selectDate(startDateController);
                },
                suffixIcon: Icon(Icons.calendar_month_sharp),
                filled: true,
                hintText: "Available From",
                controller: startDateController),
            CustomTextField(
                onTap: () {
                  selectDate(endDateController);
                },
                suffixIcon: Icon(Icons.calendar_month_sharp),
                filled: true,
                hintText: "Available To",
                controller: endDateController),
            CustomButton(
              onPressed: () async {
                String dateStr = "2024-04-10 15:30:00";
                DateTime dateTime = DateTime.parse(dateStr);
                Timestamp timestamp = Timestamp.fromDate(dateTime);

                await addVendor('test', {
                  'VendorName': 'Faraaz Khan',
                  'VendorPhone': '9149828278',
                  'VendorServiceType': 'Associate Engineer',
                  'VendorAddress': {'lat': 12.34, 'long': 56.78},
                  'VendorAvailabilityTimings': timestamp,
                  'VendorWhatsAppPhone': '1234567890',
                  'VendorEmail': 'abc@email.com',
                });

                debugPrint('STORED');

                saveVendor();
              },
              text: "Save Vendor",
            ),
          ],
        ),
      ),
    );
  }
}

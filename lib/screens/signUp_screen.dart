import 'package:flutter/material.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/screens/login_screen.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var name;
  var phoneNumber;
  var email;
  var password;
  var confrimPassword;

  signupDetails() {
    name = signUpNameController.text.trim();
    phoneNumber = signUpPhoneNoController.text.trim();
    email = signUpEmailController.text.trim();
    password = signUpPasswordController.text.trim();
    confrimPassword = signUpConfirmPasswordController.text.trim();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 550,
                ),
                CustomTextField(
                  controller: signUpNameController,
                  prefixIcon: Icon(Icons.person_2_outlined),
                  hintText: "Name",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 550,
                ),
                CustomTextField(
                  controller: signUpPhoneNoController,
                  prefixIcon: Icon(Icons.phone_outlined),
                  hintText: "Phone Number",
                ),
                CustomTextField(
                  controller: signUpEmailController,
                  hintText: "Email",
                  prefixIcon: Icon(Icons.mail_outline_outlined),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 550,
                ),
                CustomTextField(
                  controller: signUpPasswordController,
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: "Password",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 550,
                ),
                CustomTextField(
                  controller: signUpConfirmPasswordController,
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: " Confirm Password",
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 550,
                ),
                CustomButton(
                  onPressed: () {
                    signupDetails();
                    if (name.isEmpty ||
                        phoneNumber.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confrimPassword.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Fill All Fields")));
                      return;
                    }
                    if (password != confrimPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Password does not match !")));
                      return;
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddVendorScreen()));
                  },
                  text: "Sign Up",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

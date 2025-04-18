import 'package:flutter/material.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  signupDetails() {
    var name = signUpNameController.text.trim();
    var phoneNumber = signUpPhoneNoController.text.trim();
    var email = signUpEmailController.text.trim();
    var password = signUpPasswordController.text.trim();
    var confrimPassword = signUpConfirmPasswordController.text.trim();

    if (name.isEmpty ||
        phoneNumber.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confrimPassword.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Fill All Fields")));
      return;
    }
    if (password != confrimPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password does not match !")));
      return;
    }
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
                  height: MediaQuery.sizeOf(context).height - 520,
                ),
                CustomButton(
                  onPressed: () {
                    signupDetails();
                  },
                  text: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

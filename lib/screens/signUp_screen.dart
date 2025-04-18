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
                  onPressed: () {},
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

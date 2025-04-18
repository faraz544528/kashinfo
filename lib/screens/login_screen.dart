import 'package:flutter/material.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail_outline_outlined),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 550,
              ),
              CustomTextField(
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                hintText: "Password",
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 500,
              ),
              CustomButton(
                onPressed: () {},
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

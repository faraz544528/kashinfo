import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var email;
var password;

class _LoginScreenState extends State<LoginScreen> {
  loginDetails() {
    email = loginEmailController.text.trim();
    password = loginPasswordController.text.trim();
  }

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
                controller: loginEmailController,
                hintText: "Email",
                prefixIcon: Icon(Icons.mail_outline_outlined),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 550,
              ),
              CustomTextField(
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
                controller: loginPasswordController,
                obscureText: true,
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                hintText: "Password",
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height - 500,
              ),
              CustomButton(
                onPressed: () {
                  loginDetails();
                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Fill all Fields")));
                    return;
                  }
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddVendorScreen()));
                },
                text: "Login",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

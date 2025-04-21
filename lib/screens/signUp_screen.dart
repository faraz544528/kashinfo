import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kashinfo/data/controllers.dart';
import 'package:kashinfo/screens/add_vendor_screen.dart';
import 'package:kashinfo/screens/login_screen.dart';
import 'package:kashinfo/widgets/appBar.dart';
import 'package:kashinfo/widgets/my_buttons.dart';
import 'package:kashinfo/widgets/my_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) => whereToGo());
  }

  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();
    var SignedIn = pref.getBool("SignUp");
    if (SignedIn != null) {
      if (SignedIn) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AddVendorScreen()));
      }
    }
  }

  var name;
  var phoneNumber;
  var email;
  var password;
  var confrimPassword;

  signupDetails() async {
    name = signUpNameController.text.trim();
    phoneNumber = signUpPhoneNoController.text.trim();
    email = signUpEmailController.text.trim();
    password = signUpPasswordController.text.trim();
    confrimPassword = signUpConfirmPasswordController.text.trim();
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
    if (password.length != 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Requires minimum 8 Characters")));
      return;
    }
    var pref = await SharedPreferences.getInstance();
    pref.setBool("SignUp", true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => AddVendorScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: signUpNameController,
                  prefixIcon: Icon(Icons.person_2_outlined),
                  hintText: "Name",
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
                CustomTextField(
                  controller: signUpPasswordController,
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: "Password",
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
                  onPressed: () async {
                    signupDetails();
                  },
                  text: "Sign Up",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account"),
                    TextButton(
                      onPressed: () {
                        // var pref = await SharedPreferences.getInstance();
                        // pref.setBool("SignUp", true);
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

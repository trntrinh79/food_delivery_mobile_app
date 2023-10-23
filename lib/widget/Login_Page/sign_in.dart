import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_mobile_app/constraint/app_button.dart';
import 'package:food_delivery_mobile_app/constraint/custom_password_textfield.dart';
import 'package:food_delivery_mobile_app/constraint/custom_textfield.dart';
import 'package:food_delivery_mobile_app/constraint/fonts.dart';
import 'package:food_delivery_mobile_app/widget/Login_Page/sign_up.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Center(
              child: Column(
                children: [
                  Image.asset("img/logo.png"),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fast ",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF201A18),
                        ),
                      ),
                      Text(
                        "Food",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFEF8767),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text("Sign In", style: AppFontStyle.HEADLINE_LARGE),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    hintText: "User name",
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomPasswordTextfield(
                    hintText: "Password",
                    passwordController: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    // onTap: login(emailController.text.toString(),
                    // passwordController.text.toString()),
                    child: AppButton(
                      text: "Sign In",
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Opacity(
                    opacity: 0.38,
                    child: Text(
                      "Or Continue with",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 230,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "img/googlelogo.png",
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "With Google",
                                style: TextStyle(
                                    fontFamily: "roboto",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.1),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFEF8829),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset("img/fblogo.png"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset("img/twitterlogo.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 170,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5,
                          color: Color(0xFF8B93A2),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: const Text("Sign Up",
                              style: AppFontStyle.BODY_LARGE)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

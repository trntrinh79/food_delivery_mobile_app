import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_delivery_mobile_app/constraint/app_button.dart';
import 'package:food_delivery_mobile_app/constraint/custom_password_textfield.dart';
import 'package:food_delivery_mobile_app/constraint/custom_textfield.dart';
import 'package:food_delivery_mobile_app/constraint/fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  Image.asset("img/logo.png"),
                  Row(
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
                  SizedBox(
                    height: 40,
                  ),
                  Text("Sign In", style: AppFontStyle.HEADLINE_LARGE),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextField(
                    hintText: "User name",
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomPasswordTextfield(
                    hintText: "Password",
                    controller: TextEditingController(),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  AppButton(text: "Sign In", onPressed: () {}),
                  SizedBox(
                    height: 24,
                  ),
                  Opacity(
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
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 200,
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
                      SizedBox(width: 20,),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

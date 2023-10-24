import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/constraint/fonts.dart';
import 'package:food_delivery_mobile_app/pages/welcomepage.dart';

class SplashScreen extends StatelessWidget {
  Future<void> _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context); // Call the navigation method

    return Scaffold(
      // Customize your splash screen UI here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("img/logo.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fast ",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF201A18),
                  ),
                ),
                Text(
                  "Food",
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEF8767),
                  ),
                ),
              ],
            ),
            Text(
              "Food Delivery App",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                color: Color(0xFFEF8767),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

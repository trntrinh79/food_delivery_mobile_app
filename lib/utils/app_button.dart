import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                fontSize: 16),
            // TextStyle(
            //   color: Colors.white,
            //   fontSize: 16.0,
            // ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFDA7455),
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
    );
  }
}

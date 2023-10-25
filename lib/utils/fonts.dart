import 'package:flutter/material.dart';

class AppFontStyle {
  static const TextStyle HEADLINE_LARGE = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: 'Roboto',
  );
  static const TextStyle HEADLINE_MEDIUM = TextStyle(
    fontSize: 28,
    fontFamily: 'Roboto',
  );
  static const TextStyle BODY_LARGE = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    color: Color(0xFF201A18),
  );
  static const TextStyle TITLE_LARGE = TextStyle(
      fontSize: 22,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: Color(0xFF3A0A00),
      fontStyle: FontStyle.normal);
  static const TextStyle TITLE_MEDIUM = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    color: Color.fromARGB(255, 3, 3, 3),
  );
  static const TextStyle TITLE_PRODUCT = TextStyle(
    fontSize: 28,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: Color(0xFF3A0A00),
  );
}

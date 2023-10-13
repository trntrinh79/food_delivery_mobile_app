import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomPasswordTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomPasswordTextfield(
      {super.key, required this.hintText, required this.controller});

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF85736E),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Opacity(
              opacity: 0.38,
              child: TextField(
                controller: widget.controller,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ],
      ),
    );
  }
}

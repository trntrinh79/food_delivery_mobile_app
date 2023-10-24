import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/constraint/fonts.dart';

// ItemMenuList class
class ItemMenuList extends StatelessWidget {
  final String child;
  final String image;
  const ItemMenuList({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 34),
      child: Column(
        children: [
          SizedBox(
            width: 59,
            height: 48,
            child: Image.asset('img/$image'),
          ),
          Flexible(
            child: Text(
              child,
              style: AppFontStyle.TITLE_MEDIUM,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

// ItemMenuList class
class ItemMenuList extends StatelessWidget {
  final String child;
  final String image;
  const ItemMenuList({super.key, required this.child, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

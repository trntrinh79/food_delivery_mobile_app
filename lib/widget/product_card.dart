import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.price});
  late String image;
  late String title;
  late String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: AppColor.productBG,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border_rounded),
            ),
            const SizedBox(
              height: 12,
            ),
            Image(
              image: AssetImage("img/$image"),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 160),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: AppFontStyle.TITLE_PRODUCT,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.38,
                      child: Text(
                        price,
                        style: AppFontStyle.TITLE_LARGE,
                      ),
                    ),
                    const Icon(
                      Icons.add_box_outlined,
                      size: 24,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

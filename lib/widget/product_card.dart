import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/model/home_product_data_model.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

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
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.favorite_border_rounded)),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 286,
              height: 250,
              child: Image(
                // image: AssetImage("img/$image"),
                image: NetworkImage(productDataModel.imageUrl),
              ),
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
                        productDataModel.name,
                        style: AppFontStyle.TITLE_PRODUCT,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.38,
                      child: Text(
                        "\$" + productDataModel.price.toString(),
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

import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class CartCard extends StatelessWidget {
  CartCard({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    var quantity = productDataModel.quantity;
    quantity = 2;
    var price = productDataModel.price;
    var totalPrice = quantity * price;
    productDataModel.totalPrice = totalPrice;

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
                ),
                Row(
                  children: [
                    const Text(
                      "Total Price: ",
                      style: AppFontStyle.TITLE_PRODUCT,
                    ),
                    Text(
                      productDataModel.totalPrice.toString(),
                      style: AppFontStyle.TITLE_PRODUCT,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

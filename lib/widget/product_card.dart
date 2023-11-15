import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';
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
                  onTap: () {
                    BlocProvider.of<FavoriteCubit>(context)
                        .addToFavorite(productDataModel);
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text("Added to favorite"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        productDataModel.name,
                        style: AppFontStyle.TITLE_PRODUCT,
                      ),
                    ),
                    Opacity(
                      opacity: 0.38,
                      child: Text(
                        "\$" + productDataModel.price.toString(),
                        style: AppFontStyle.TITLE_LARGE,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartCubit>(context)
                        .addToCart(productDataModel);
                    const snackBar = SnackBar(
                      duration: Duration(milliseconds: 100),
                      content: Text("Added to cart"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.add,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

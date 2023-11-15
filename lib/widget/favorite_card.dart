import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class FavoriteCard extends StatefulWidget {
  FavoriteCard({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.productBG,
                    borderRadius: BorderRadius.circular(10)),
                width: 100,
                height: 100,
                child: Container(
                  width: 90,
                  height: 90,
                  child: Image(
                    image: NetworkImage(widget.productDataModel.imageUrl),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productDataModel.name,
                      style: AppFontStyle.TITLE_LARGE,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColor.appTheme,
                        ),
                        Text(
                          " 5.0",
                          style: AppFontStyle.TITLE_MEDIUM,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "\$" + widget.productDataModel.price.toString(),
                      style: AppFontStyle.TITLE_LARGE,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

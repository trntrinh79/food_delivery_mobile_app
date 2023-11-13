import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_mobile_app/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class CartCard extends StatefulWidget {
  CartCard({super.key, required this.productDataModel});

  final ProductDataModel productDataModel;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Slidable(
          key: Key(widget.productDataModel.id.toString()),
          endActionPane: ActionPane(
              motion: ScrollMotion(),
              dismissible: DismissiblePane(
                onDismissed: () {
                  BlocProvider.of<CartCubit>(context)
                      .removeFromCart(widget.productDataModel);
                },
              ),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    BlocProvider.of<CartCubit>(context)
                        .removeFromCart(widget.productDataModel);
                  },
                  backgroundColor: Colors.grey.shade50,
                  icon: Icons.delete,
                )
              ]),
          child: Container(
            padding: EdgeInsets.only(left: 16, bottom: 16, right: 16),
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
                        "\$" +
                            widget.productDataModel.totalItemPrice.toString(),
                        style: AppFontStyle.TITLE_LARGE,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.appTheme,
                          borderRadius: BorderRadius.circular(20)),
                      child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<CartCubit>(context)
                              .incrementQuantity(widget.productDataModel);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      child: Text(
                        widget.productDataModel.quantity.toString(),
                        style: AppFontStyle.TITLE_MEDIUM,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CartCubit>(context)
                            .decrementQuantity(widget.productDataModel);
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

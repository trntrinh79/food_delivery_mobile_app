// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery_mobile_app/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';
import 'package:food_delivery_mobile_app/widget/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CartLoadedState) {
          final cartCubit = context.read<CartCubit>();
          double totalCartValue = cartCubit.calculateTotalCartValue();
          var item = state.productList;
          print("${totalCartValue}");
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
              toolbarHeight: 0,
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Cart",
                          style: AppFontStyle.HEADLINE_LARGE,
                        ),
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: item.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, int index) {
                              final product = state.productList[index];
                              bool last = item.length == (index + 1);
                              return Padding(
                                padding: EdgeInsets.only(bottom: last ? 0 : 16),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: CartCard(productDataModel: product),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 150,
              width: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: AppFontStyle.TITLE_MEDIUM,
                      ),
                      Text(
                        "\$${totalCartValue.toString()}",
                        style: AppFontStyle.TITLE_MEDIUM,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

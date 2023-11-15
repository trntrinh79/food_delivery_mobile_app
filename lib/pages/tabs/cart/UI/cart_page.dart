// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:food_delivery_mobile_app/cubit/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';
import 'package:food_delivery_mobile_app/widget/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

@override
class _CartPageState extends State<CartPage> {
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
          if (item.isEmpty) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.grey[50],
                elevation: 0,
                toolbarHeight: 0,
              ),
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            "Cart",
                            style: AppFontStyle.HEADLINE_LARGE,
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/img/empty_shopping.png'),
                          )),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const Text(
                          "Hungry!",
                          style: AppFontStyle.HEADLINE_MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "You don’t have any foods in cart at this time!",
                          style: AppFontStyle.BODY_LARGE,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
              toolbarHeight: 0,
            ),
            body: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
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
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: item.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, int index) {
                                final product = state.productList[index];
                                bool last = item.length == (index + 1);
                                return Padding(
                                  padding:
                                      EdgeInsets.only(bottom: last ? 0 : 16),
                                  child: Slidable(
                                      key: const Key("hello"),
                                      endActionPane: ActionPane(
                                          dismissible: DismissiblePane(
                                            onDismissed: () {
                                              BlocProvider.of<CartCubit>(
                                                      context)
                                                  .removeFromCart(product);
                                            },
                                            key: const Key("helklo"),
                                          ),
                                          extentRatio: 0.2,
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onPressed:
                                                  (BuildContext context) {
                                                BlocProvider.of<CartCubit>(
                                                        context)
                                                    .removeFromCart(product);
                                              },
                                              backgroundColor:
                                                  Colors.grey.shade50,
                                              icon: Icons.delete,
                                            ),
                                          ]),
                                      direction: Axis.horizontal,
                                      child:
                                          CartCard(productDataModel: product)),
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
            ),
            bottomNavigationBar: Container(
              height: 100,
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
                        style: AppFontStyle.TITLE_LARGE,
                      ),
                      Text(
                        "\$${totalCartValue.toString()}",
                        style: AppFontStyle.TITLE_LARGE,
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

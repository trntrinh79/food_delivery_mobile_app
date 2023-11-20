// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:food_delivery_mobile_app/cubit/favorite_cubit/favorite_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/nav_cubit/navigation_cubit.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

import 'package:food_delivery_mobile_app/widget/favorite_card.dart';

class FavoriteFood extends StatefulWidget {
  const FavoriteFood({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoriteFood> createState() => _FavoriteFoodState();
}

class _FavoriteFoodState extends State<FavoriteFood> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          var item = state.favoriteProducts;
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your",
                                  style: AppFontStyle.HEADLINE_MEDIUM,
                                ),
                                Text(
                                  "Favorite Food",
                                  style: AppFontStyle.HEADLINE_LARGE,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: CircleAvatar(
                                child: Image(
                                  image: AssetImage('assets/img/BG.png'),
                                ),
                              ),
                            ),
                          ],
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
                          "Empty!",
                          style: AppFontStyle.HEADLINE_MEDIUM,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "You don’t have any foods in favorite at this time!",
                          style: AppFontStyle.BODY_LARGE,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<NavigationCubit>(context)
                                .showHomePage();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFDA7455),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 24.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your",
                                  style: AppFontStyle.HEADLINE_MEDIUM,
                                ),
                                Text(
                                  "Favorite Food",
                                  style: AppFontStyle.HEADLINE_LARGE,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 48,
                              height: 48,
                              child: CircleAvatar(
                                child: Image(
                                  image: AssetImage('assets/img/BG.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          child: Image.asset('assets/img/burger_discount.png'),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: item.length,
                              itemBuilder: (context, int index) {
                                final product = state.favoriteProducts[index];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          item.length == (index + 1) ? 0 : 16),
                                  child: Slidable(
                                      key: ValueKey(product.id),
                                      endActionPane: ActionPane(
                                          dismissible: DismissiblePane(
                                            onDismissed: () {
                                              BlocProvider.of<FavoriteCubit>(
                                                      context)
                                                  .removeFromFavorite(product);
                                            },
                                          ),
                                          extentRatio: 0.2,
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              onPressed:
                                                  (BuildContext context) {
                                                BlocProvider.of<FavoriteCubit>(
                                                        context)
                                                    .removeFromFavorite(
                                                        product);
                                              },
                                              backgroundColor:
                                                  Colors.grey.shade50,
                                              icon: Icons.delete,
                                            ),
                                          ]),
                                      direction: Axis.horizontal,
                                      child: FavoriteCard(
                                          productDataModel: product)),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            child: Text("Empty"),
          );
        }
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:food_delivery_mobile_app/cubit/favorite_cubit/favorite_cubit.dart';
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
    // TODO: implement initState
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
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, int index) {
                                final product = state.favoriteProducts[index];
                                bool last = item.length == (index + 1);
                                return Padding(
                                  padding:
                                      EdgeInsets.only(bottom: last ? 0 : 16),
                                  child: Slidable(
                                      key: const Key("hello"),
                                      endActionPane: ActionPane(
                                          dismissible: DismissiblePane(
                                            onDismissed: () {
                                              BlocProvider.of<FavoriteCubit>(
                                                      context)
                                                  .removeFromFavorite(product);
                                              setState(() {});
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
                                                BlocProvider.of<FavoriteCubit>(
                                                        context)
                                                    .removeFromFavorite(
                                                        product);
                                                setState(() {});
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

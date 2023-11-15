import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';
import 'package:food_delivery_mobile_app/widget/item_menu_list.dart';
import 'package:food_delivery_mobile_app/widget/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.listItemName,
    required this.listImage,
  });

  final List listItemName;
  final List listImage;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      if (state is LoadingState) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is LoadedState) {
        var info = state.places;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Specials",
                          style: AppFontStyle.HEADLINE_MEDIUM,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: CircleAvatar(
                              child: Image(
                                image: AssetImage('assets/img/BG.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 105),
                      child: Text(
                        "Delicious food for you",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontSize: 36),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listItemName.length,
                        itemBuilder: (context, int index) {
                          bool last = listItemName.length == (index + 1);
                          return Padding(
                            padding: EdgeInsets.only(right: last ? 0 : 34),
                            child: ItemMenuList(
                              child: listItemName[index],
                              image: listImage[index],
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .7,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, int index) {
                            bool last = info.length == (index + 1);
                            return Padding(
                              padding: EdgeInsets.only(right: last ? 0 : 20),
                              child: GestureDetector(
                                onTap: () {
                                  BlocProvider.of<AppCubit>(context)
                                      .detailPage(info[index]);
                                },
                                child: ProductCard(
                                  productDataModel: info[index],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}

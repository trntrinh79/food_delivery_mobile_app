import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/utils/app_icon.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      DetailState detail = state as DetailState;
      var detailinfo = detail.place;
      return Scaffold(
        body: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 450,
              decoration: BoxDecoration(
                color: AppColor.productBG,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Image.network(
                    detailinfo.imageUrl,
                    width: 280,
                    height: 250,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => BlocProvider.of<AppCubit>(context).goHome(),
                    child: const AppIcon(icon: Icons.arrow_back_ios)),
                GestureDetector(
                    onTap: () {},
                    child: const AppIcon(icon: Icons.shopping_cart_outlined)),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 380,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[50]),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              detailinfo.name,
                              style: AppFontStyle.HEADLINE_LARGE,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$" + detailinfo.price.toString(),
                                style: AppFontStyle.HEADLINE_MEDIUM,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 24,
                                    color: AppColor.appTheme,
                                  ),
                                  const Text(
                                    "5",
                                    style: AppFontStyle.TITLE_MEDIUM,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Introduce",
                          style: AppFontStyle.TITLE_LARGE,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          detailinfo.description,
                          style: AppFontStyle.BODY_LARGE,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 120,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.favorite_sharp,
                  size: 32,
                ),
              ),
              Container(
                height: 56,
                width: 300,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDA7455),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}

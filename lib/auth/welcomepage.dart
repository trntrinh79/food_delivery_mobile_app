import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/auth/Login_Page/sign_in.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';

import 'package:food_delivery_mobile_app/utils/colors.dart';
import 'package:food_delivery_mobile_app/utils/fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  List imagesList = [
    "welcomepage_1.png",
    "welcomepage_2.png",
    "welcomepage_3.png",
  ];
  List texttitleList = ["Fresh food", "Fast Delivery", "Easy Payment"];
  List textsList = [
    "We make it simple to find the food you crave. Enter your address and let us do the rest.",
    "When you order eat street, we’ll hook you up with exclusive coupons, specials rewards.",
    "We make food ordering fast, simple and free no matter if you order online or cash."
  ];
  List buttonnextList = [
    "next_btn1.png",
    "next_btn2.png",
    "next_btn3.png",
  ];
  void _goToNextPage() {
    if (_pageController.page != null &&
        _pageController.page! < imagesList.length - 1) {
      _pageController.animateToPage(
        _pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  final lastPage = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: imagesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 53,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                        // BlocProvider.of<AppCubit>(context).getData();
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: AppColor.appTheme,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 334,
                        height: 280,
                        child: Image.asset("assets/img/" + imagesList[index]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        texttitleList[index],
                        style: AppFontStyle.HEADLINE_LARGE,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        textsList[index],
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imagesList.length, (indexDots) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 8,
                    height: index == indexDots ? 24 : 8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? const Color(0xFFDA7455)
                            : const Color.fromARGB(255, 235, 181, 106)
                          ..withOpacity(0.3)),
                  );
                }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: GestureDetector(
                        onTap: _goToNextPage,
                        child: Container(
                          child: Image(
                            image: AssetImage(
                                "assets/img/" + buttonnextList[index]),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

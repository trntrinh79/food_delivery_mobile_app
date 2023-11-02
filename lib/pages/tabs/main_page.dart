import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/pages/tabs/cart/UI/cart_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/chat/UI/chat_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/favorite/UI/favorite_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/UI/home_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/bloc/home_bloc.dart';
import 'package:food_delivery_mobile_app/pages/tabs/menu_page.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _childrenPages = [
    const HomePage(
      listItemName: [
        "Sushi",
        "Burger",
        "Pizza",
        "Spaghetti",
        "Salad",
      ],
      listImage: [
        "sushi_icon.png",
        "burger.png",
        "pizza.png",
        "spaghetti.png",
        "salad.png",
      ],
    ),
    const FavoriteFood(),
    const MenuPage(),
    const ChatPage(),
    const CartPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavItem = const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: InkWell(child: Icon(Icons.home_outlined, size: 24)),
          label: "",
          activeIcon: Icon(Icons.home)),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 24),
          label: "",
          activeIcon: Icon(Icons.favorite)),
      BottomNavigationBarItem(
          icon: Icon(Icons.widgets_outlined, size: 24),
          label: "",
          activeIcon: Icon(Icons.widgets)),
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined, size: 24),
          label: "",
          activeIcon: Icon(Icons.chat)),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_outlined, size: 24),
          label: "",
          activeIcon: Icon(Icons.list_alt)),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.appBG,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: bottomNavItem,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          selectedItemColor: Colors.black),
      body: _childrenPages[currentIndex],
    );
  }
}

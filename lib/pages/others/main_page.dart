import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/cubit/app_cubit/app_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/nav_cubit/navigation_cubit.dart';
import 'package:food_delivery_mobile_app/cubit/nav_cubit/navigationbar_item.dart';
import 'package:food_delivery_mobile_app/pages/tabs/cart/UI/cart_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/chat/UI/chat_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/favorite/UI/favorite_page.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/home_page.dart';
import 'package:food_delivery_mobile_app/pages/others/menu_page.dart';
import 'package:food_delivery_mobile_app/utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
              toolbarHeight: 0,
            ),
            bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                return BottomNavigationBar(
                  backgroundColor: AppColor.appBG,
                  showSelectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  showUnselectedLabels: false,
                  currentIndex: state.index,
                  items: const [
                    BottomNavigationBarItem(
                        icon:
                            InkWell(child: Icon(Icons.home_outlined, size: 24)),
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
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      print("homepage");
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.home);
                    } else if (index == 1) {
                      print("favorite page");
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.favorite);
                    } else if (index == 2) {
                      print("menu page");
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.menu);
                    } else if (index == 3) {
                      print("chat page");
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.chat);
                    } else if (index == 4) {
                      print("cart page");
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarItem.cart);
                    }
                  },
                );
              },
            ),
            body: BlocBuilder<NavigationCubit, NavigationState>(
              builder: (context, state) {
                if (state.navbarItem == NavbarItem.home) {
                  return const HomePage(
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
                  );
                } else if (state.navbarItem == NavbarItem.favorite) {
                  return const FavoriteFood();
                } else if (state.navbarItem == NavbarItem.menu) {
                  return const MenuPage();
                } else if (state.navbarItem == NavbarItem.chat) {
                  return const ChatPage();
                } else if (state.navbarItem == NavbarItem.cart) {
                  return CartPage();
                }
                return Container();
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

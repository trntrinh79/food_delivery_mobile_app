import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/cubit/nav_cubit/navigationbar_item.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.favorite:
        emit(NavigationState(NavbarItem.favorite, 1));
        break;
      case NavbarItem.menu:
        emit(NavigationState(NavbarItem.menu, 2));
        break;
      case NavbarItem.chat:
        emit(NavigationState(NavbarItem.chat, 3));
        break;
      case NavbarItem.cart:
        emit(NavigationState(NavbarItem.cart, 4));
        break;
    }
  }

  void showHomePage() {
    emit(NavigationHomePage(NavbarItem.home, 0));
  }
}

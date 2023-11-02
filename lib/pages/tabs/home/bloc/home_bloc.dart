import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(0)) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeEvent>((event, emit) {
      if (event is TabChange) {
        // print(event.tabIndex);
        emit(HomeInitial(event.tabIndex));
      }
    });
    on<HomeProductFavoriteButtonClickedEvent>(
        homeProductFavoriteButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeFavoriteButtonNavigateEvent>(homeFavoriteButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState(state.tabIndex));
    await Future.delayed(const Duration(seconds: 2));
    emit(
      HomeLoadedSuccessState(
          state.tabIndex,
          FoodData.foodData
              .map((e) => ProductDataModel(
                  id: e["id"],
                  name: e["name"],
                  description: e["description"],
                  price: e["price"],
                  imageUrl: e["imageUrl"]))
              .toList()),
    );
  }

  FutureOr<void> homeProductFavoriteButtonClickedEvent(
      HomeProductFavoriteButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Favorite product clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Cart product clicked");
  }

  FutureOr<void> homeFavoriteButtonNavigateEvent(
      HomeFavoriteButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("favorite navigate clicked");
    emit(const HomeNavigatetoFavoritePageActionState(1));
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart navigate clicked");
    emit(const HomeNavigatetoFavoritePageActionState(4));
  }
}

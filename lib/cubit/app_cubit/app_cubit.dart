import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(AppInitial()) {
    emit(SplashState());
  }
  final FoodData data;
  late final places;
  List<ProductDataModel> cartItems = [];
  void goToWelcomePage() {
    emit(WelcomeState());
  }

  void getData() async {
    try {
      List<ProductDataModel> listData = FoodData.foodData
          .map((e) => ProductDataModel(
                quantity: e["quantity"],
                totalItemPrice: e["totalPrice"],
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imageUrl: e["imageUrl"],
              ))
          .toList();
      await Future(() => emit(LoadingState()));
      await Future<void>.delayed(const Duration(seconds: 1));
      places = listData;
      emit(LoadedState(places));
    } catch (e) {
      print(e);
    }
  }

  goHome() {
    emit(LoadedState(places));
  }

  detailPage(ProductDataModel data) {
    emit(DetailState(data));
  }
}

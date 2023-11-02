import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_mobile_app/data/food_data.dart';
import 'package:food_delivery_mobile_app/pages/tabs/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.data) : super(AppInitial()) {
    Future<void>.delayed(const Duration(seconds: 2));

    // emit(WelcomeState());

    emit(LoadedState(listData));
    // print(places);
  }
  final FoodData data;
  late final places;
  List<ProductDataModel> listData = FoodData.foodData
      .map((e) => ProductDataModel(
            id: e["id"],
            name: e["name"],
            description: e["description"],
            price: e["price"],
            imageUrl: e["imageUrl"],
          ))
      .toList();

  void getData() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 3));
      emit(LoadingState());
      places = listData;
      emit(LoadedState(places));
    } catch (e) {}
  }

  // gohome() {
  //   emit(LoadedState(places));
  // }
}


// FoodData.foodData
//             .map((e) => ProductDataModel(
//                 id: e["id"],
//                 name: e["name"],
//                 description: e["description"],
//                 price: e["price"],
//                 imageUrl: e["imageUrl"]))
//             .toList(),

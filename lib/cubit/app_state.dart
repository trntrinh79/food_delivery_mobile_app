part of 'app_cubit.dart';

@immutable
abstract class AppState extends Equatable {}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  final List<ProductDataModel> places;
  LoadedState(this.places);

  @override
  List<Object> get props => [places];

  // @override
  // List<Object> get props => [places];
  // @override
  // List<Object> get props => [
  //       FoodData.foodData
  //           .map((e) => ProductDataModel(
  //               id: e["id"],
  //               name: e["name"],
  //               description: e["description"],
  //               price: e["price"],
  //               imageUrl: e["imageUrl"]))
  //           .toList(),
  //     ];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

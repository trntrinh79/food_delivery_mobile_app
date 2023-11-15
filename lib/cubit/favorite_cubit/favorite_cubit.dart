import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<ProductDataModel> favoriteProducts = [];
  void addToFavorite(ProductDataModel product) {
    // Check if the product is already in the favorites list
    if (!favoriteProducts.any((item) => item.id == product.id)) {
      favoriteProducts.add(product);
      emit(FavoriteLoaded(List.from(favoriteProducts)));
    }
  }

  void loadFavorites() {
    emit(FavoriteLoaded(favoriteProducts));
  }

  void removeFromFavorite(ProductDataModel product) {
    favoriteProducts.removeWhere((item) => item.id == product.id);
    emit(FavoriteLoaded(List.from(favoriteProducts)));
  }
}

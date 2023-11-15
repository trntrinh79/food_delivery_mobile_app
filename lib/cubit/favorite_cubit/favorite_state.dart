part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<ProductDataModel> favoriteProducts;

  FavoriteLoaded(this.favoriteProducts);

  @override
  List<Object> get props => [favoriteProducts];
}

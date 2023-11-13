part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {
  const CartLoadingState();

  @override
  List<Object> get props => [];
}

class CartLoadedState extends CartState {
  final List<ProductDataModel> productList;
  final double totalCartPrice;

  CartLoadedState(this.productList, this.totalCartPrice);
  @override
  List<Object> get props => [productList, totalCartPrice];
}

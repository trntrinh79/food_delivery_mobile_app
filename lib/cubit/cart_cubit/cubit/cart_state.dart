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

  CartLoadedState(this.productList);
  @override
  List<Object> get props => [productList];
}

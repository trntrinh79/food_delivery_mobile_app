import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductDataModel> productList = [];

  void addToCart(ProductDataModel productModels) {
    var price = productModels.price;
    int index = productList.indexWhere((cartItem) =>
        cartItem.id == productModels.id &&
        cartItem.name == productModels.name &&
        cartItem.description == productModels.description &&
        cartItem.price == productModels.price &&
        cartItem.imageUrl == productModels.imageUrl);
    emit(const CartLoadingState());
    Future<void>.delayed(const Duration(seconds: 1));
    if (index != -1) {
      productList[index].quantity++;
      productList[index].totalItemPrice = double.parse(
          (price * productList[index].quantity).toStringAsFixed(2));
    } else {
      productModels.quantity = 1;
      productModels.totalItemPrice = price * productModels.quantity;
      productList.add(
        productModels,
      );
    }
    emit(CartLoadedState(productList, productModels.totalCartPrice));
  }

  void incrementQuantity(ProductDataModel product) {
    int index = productList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      productList[index].quantity++;
      productList[index].totalItemPrice =
          calculateTotalPrice(productList[index]);
      product.totalCartPrice =
          productList.fold(0, (sum, item) => sum + item.totalItemPrice);
      emit(CartLoadedState(List.from(productList), product.totalCartPrice));
    }
  }

  void decrementQuantity(ProductDataModel product) {
    int index = productList.indexWhere((item) => item.id == product.id);
    if (index != -1 && productList[index].quantity > 1) {
      productList[index].quantity--;
      productList[index].totalItemPrice =
          calculateTotalPrice(productList[index]);
      product.totalCartPrice =
          productList.fold(0, (sum, item) => sum + item.totalItemPrice);
      emit(CartLoadedState(List.from(productList), product.totalCartPrice));
    }
  }

  void removeFromCart(ProductDataModel product) {
    productList.removeWhere((item) => item.id == product.id);
    emit(CartLoadedState(List.from(productList), product.totalCartPrice));
  }

  double calculateTotalPrice(ProductDataModel product) {
    return double.parse(
      (product.price * product.quantity).toStringAsFixed(2),
    );
  }

  double calculateTotalCartValue() {
    double total = 0.0;
    for (var product in productList) {
      total += product.totalItemPrice;
    }
    return double.parse(total.toStringAsFixed(2));
  }
}

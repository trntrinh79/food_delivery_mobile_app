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

  Future<void> removeFromCart(ProductDataModel product) async {
    productList.removeWhere((item) => item.id == product.id);
    double newTotalCartValue =
        productList.fold(0, (sum, item) => sum + item.price * item.quantity);

    emit(CartLoadedState(List.from(productList), newTotalCartValue));
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

  void loadCartItems() {
    try {
      // Simulate fetching cart items
      List<ProductDataModel> cartItems =
          productList; // Fetch items from your data source

      double totalCartValue =
          cartItems.fold(0, (sum, item) => sum + item.totalCartPrice);

      // Emit the loaded state with cart items and total value
      emit(CartLoadedState(cartItems, totalCartValue));
    } catch (e) {
      // In case of an error, you might want to emit an error state
      print(e); // Log the error
    }
  }
}

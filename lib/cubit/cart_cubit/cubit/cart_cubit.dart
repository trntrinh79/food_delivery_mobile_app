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
      productList[index].totalPrice = double.parse(
          (price * productList[index].quantity).toStringAsFixed(2));
    } else {
      productModels.quantity = 1;
      productModels.totalPrice = price * productModels.quantity;
      productList.add(productModels);
    }
    emit(CartLoadedState(productList));
  }

  void incrementQuantity(ProductDataModel product) {
    int index = productList.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      productList[index].quantity++;
      productList[index].totalPrice = calculateTotalPrice(productList[index]);
      emit(CartLoadedState(List.from(productList)));
    }
  }

  void decrementQuantity(ProductDataModel product) {
    int index = productList.indexWhere((item) => item.id == product.id);
    if (index != -1 && productList[index].quantity > 1) {
      productList[index].quantity--;
      productList[index].totalPrice = calculateTotalPrice(productList[index]);
      emit(CartLoadedState(List.from(productList)));
    }
  }

  void removeFromCart(ProductDataModel product) {
    productList.removeWhere((item) => item.id == product.id);
    emit(CartLoadedState(List.from(productList)));
  }

  double calculateTotalPrice(ProductDataModel product) {
    return double.parse(
      (product.price * product.quantity).toStringAsFixed(2),
    );
  }
}

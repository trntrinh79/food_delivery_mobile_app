import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:food_delivery_mobile_app/model/home_product_data_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductDataModel> productList = [];

  void addToCart(ProductDataModel productModels) async {
    var quantity = productModels.quantity;
    var price = productModels.price;
    emit(const CartLoadingState());
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      productList.add(productModels);
      emit(CartLoadedState(productList));
      quantity = 1;
      productModels.totalPrice = price * quantity;
      print(quantity);
      print(productModels.totalPrice);
    } catch (e) {
      print(e);
    }
  }
}

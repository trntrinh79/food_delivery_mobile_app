// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  int quantity;
  double totalPrice;
  ProductDataModel({
    this.quantity = 0,
    this.totalPrice = 0.0,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

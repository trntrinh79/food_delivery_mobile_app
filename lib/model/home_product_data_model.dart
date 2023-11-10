// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int quantity;
  late double totalPrice;
  ProductDataModel({
    required this.quantity,
    required this.totalPrice,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

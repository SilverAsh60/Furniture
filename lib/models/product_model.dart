import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String img;
  final String id;
  final Map<String, String> size;
  final double rootPrice;
  final double currentPrice;
  final String status;
  final String categoryItemId;
  final String description;
  final Map<String, String> material;
  final double review;
  final double sellest;
  final DateTime dateEnter;

  Product({
    required this.name,
    required this.img,
    required this.id,
    required this.description,
    required this.size,
    required this.rootPrice,
    required this.currentPrice,
    required this.categoryItemId,
    required this.status,
    required this.material,
    required this.review,
    required this.sellest,
    required this.dateEnter,
  });
}

class ProductItem {
  final String id;
  final Map<String,String> color;
  final List<String> img;

  ProductItem({
    required this.img,
    required this.color,
    required this.id,
  });
}

class Product {
  final String name;
  final String img;
  final String id;
  final List<String> size;
  final double rootPrice;
  final double currentPrice;
  final String status;
  final String categoryItemId;
  final String description;
  final String color;

  Product({
    required this.name,
    required this.color,
    required this.img,
    required this.id,
    required this.description,
    required this.size,
    required this.rootPrice,
    required this.currentPrice,
    required this.categoryItemId,
    required this.status,
  });
}

class ProductItem {
  final String id;
  final String color;
  final List<String> img;

  ProductItem({
    required this.img,
    required this.color,
    required this.id,
  });
}
